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

    var items: [Session] { viewModel.sessionsList }
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
        title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.register(AlbumCollectionCell.self)
        collectionView.setCell(type: .twoColumn)
        viewModel.loadData(showLoader: false)

        viewModel.reloadFields.filter { $0 == true }.bind(to: collectionView.rx.reloadData).disposed(by: disposeBag)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionCell.identifier, for: indexPath) as! AlbumCollectionCell
        cell.setData(with: items[indexPath.row])
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
