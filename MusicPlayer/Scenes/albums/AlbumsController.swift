//
//  CollectionViewController.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import RxSwift
import UIKit

import RxCocoa
final class AlbumsController: UICollectionViewController {
    private let viewModel: AlbumsViewModelType
    private let disposeBag = DisposeBag()

    var albums: [Session] { viewModel.sessionsList }
    init(viewModel: AlbumsViewModelType) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollection()
        bindToViewModel()
    }

    private func bindToViewModel() {
//        viewModel.loadData(showLoader: false)
        viewModel.reloadFields.filter { $0 == true }.bind(to: collectionView.rx.reloadData).disposed(by: disposeBag)
    }

    private func setupCollection() {
        title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(AlbumCollectionCell.self)
        collectionView.setCell(type: .twoColumn)
    }

    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Str.search
        navigationItem.searchController = searchController
        /// ios 10 compatiblity
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionCell.identifier, for: indexPath) as! AlbumCollectionCell
        cell.setData(with: albums[indexPath.row])
        return cell
    }
}

extension Reactive where Base: UICollectionView {
    public var reloadData: Binder<Bool> {
        return Binder(base) { collectionView, active in
            if active {
                collectionView.reloadData()
            }
        }
    }
}

extension AlbumsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.isActive else {
            viewModel.searchCanceled()
            return
        }
        guard let text = searchController.searchBar.text else { return }
        viewModel.searchFor.onNext(text)
    }
}
