//
//  AlbumsViewModel.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation

import Combine
import RxSwift

protocol AlbumsViewModelType {
    func loadData(showLoader: Bool)
    func searchCanceled()
    var searchFor: PublishSubject<String> { get }
    var sessionsList: [Session] { get }
    var reloadFields: PublishSubject<Bool> { get }
}

final class AlbumsViewModel: AlbumsViewModelType {
    let searchFor = PublishSubject<String>()

    private(set) var reloadFields = PublishSubject<Bool>()

//    private let showLoader = PublishSubject<Bool>()
    private let apiClient: ApiClient
    private var page = Page()
    var sessionsList: [Session] {
        isSearchingMode ? searchResultList : _sessionsList
    }

    private(set) var _sessionsList: [Session] = []

    private(set) var searchResultList: [Session] = []
    private var isSearchingMode = false
    private let disposeBag = DisposeBag()
    private let showLoader = PublishSubject<Bool>()

    init(apiClient: ApiClient = HTTPClient()) {
        self.apiClient = apiClient
        bindForSearch()
    }

    func searchCanceled() {
        isSearchingMode = false
        reloadFields.onNext(true)
    }

    func loadData(showLoader: Bool = true) {
        guard page.shouldLoadMore else {
            return
        }
        page.isFetchingData = true
//        showLoader ? self.showLoader.onNext(true) : ()
        let apiEndpoint = AlbumsApi.feed(page: page.currentPage, count: page.countPerPage)
        let api: Observable<AlbumsResponse?> = apiClient.getData(of: apiEndpoint)

        api.subscribe(onNext: { [unowned self] value in

            self._sessionsList.append(contentsOf: value?.data.sessions ?? [])
            self.reloadFields.onNext(true)
            showLoader ? self.showLoader.onNext(false) : ()
        }, onError: { err in
//                  self.error.onNext(err)
            print(">>failure")

            print(err)
        }).disposed(by: disposeBag)
    }

    private func bindForSearch() {
        searchFor.distinctUntilChanged()
            .subscribe(onNext: { [unowned self] text in
                // remove repeated values
                //        showLoader ? self.showLoader.onNext(true) : ()

                let endpoint: Observable<AlbumsResponse?> = self.apiClient.getData(of: AlbumsApi.search(text))
                endpoint.subscribe(onNext: { [unowned self] value in
                    self.isSearchingMode = true
                    self.searchResultList = value?.data.sessions ?? []
                    self.reloadFields.onNext(true)
                }, onError: { err in
                    //                  self.error.onNext(err)
                    print(">>failure")

                    print(err)
                }).disposed(by: self.disposeBag)
            }).disposed(by: disposeBag)
    }

    private func updatePage(with count: Int) {
        page.isFetchingData = false
        page.currentPage += 1
        page.fetchedItemsCount = count
    }

    func loadMoreCells(prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            loadData(showLoader: false)
        }
    }

    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row + 10 >= page.fetchedItemsCount
    }
}
