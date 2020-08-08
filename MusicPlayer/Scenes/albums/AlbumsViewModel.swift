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
    var sessionsList: [Session] { get }
    var reloadFields: PublishSubject<Bool> { get }
}

final class AlbumsViewModel: AlbumsViewModelType {
    private(set) var reloadFields = PublishSubject<Bool>()

//    private let showLoader = PublishSubject<Bool>()
    private let apiClient: ApiClient
    private var page = Page()
    private(set) var sessionsList: [Session] = []
    private let disposeBag = DisposeBag()
    private let showLoader = PublishSubject<Bool>()

    init(apiClient: ApiClient = HTTPClient()) {
        self.apiClient = apiClient
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

            self.sessionsList.append(contentsOf: value?.data.sessions ?? [])
            self.reloadFields.onNext(true)
            showLoader ? self.showLoader.onNext(false) : ()
            self.handleApiResponse()
        }, onError: { err in
//                  self.error.onNext(err)
            print(">>failure")

            print(err)
        }).disposed(by: disposeBag)
    }

    private func updatePage(with count: Int) {
        page.isFetchingData = false
        page.currentPage += 1
        page.fetchedItemsCount = count
    }

    /// emit values to ui to fill the table view if the data is a littlet reload untill fill the table
    private func handleApiResponse() {
//        let artists = sortMusicByArtist(allSongsList)
//        artistsList.onNext(artists)
//        updatePage(with: artists.count)
    }

//    /// group the songs by artist
//    /// - Parameter list: list of songs for every Artist
//    func sortMusicByArtist(_ list: SongsList) -> [Artist] {
//        var users: [String: Artist] = [:]
//        for song in list {
//            if var user = users[song.userId ?? ""] {
//                user.songsCount += 1
//                users[song.userId ?? ""] = user
//            } else {
//                var user = song.user
//                user?.songsCount += 1
//                users[song.userId ?? ""] = user
//            }
//        }
//
//        return users.values.sorted { $0.songsCount > $1.songsCount }
//    }

    /// return songs list for th singer
    /// - Parameter user: the current user that will display his songs
//    func songsOf(user: Artist) {
//        currentUser = user
//        let songs = allSongsList.filter { $0.userId == user.id }
//        didSelectArtistsAlbum.onNext(songs)
//    }
//
    func loadMoreCells(prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            loadData(showLoader: false)
        }
    }

    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row + 10 >= page.fetchedItemsCount
    }
}
