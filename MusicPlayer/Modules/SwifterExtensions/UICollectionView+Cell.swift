//
//  UICollectionView+Cell.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    /// TIP: you must set the reuse identifier as same as the nib file name.
    func register<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.identifier, bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func setCell(width: CGFloat, height: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cellSize = CGSize(width: width, height: height)
        layout.itemSize = cellSize
        layout.sectionInset = .zero
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 0
        setCollectionViewLayout(layout, animated: true)
    }
}
