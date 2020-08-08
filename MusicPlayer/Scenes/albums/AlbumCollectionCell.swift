//
//  AlbumCollectionCell.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import UIKit

final class AlbumCollectionCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var genresLabel: UILabel!

    func setData(with session: Session) {
        imageView.setImage(with: session.currentTrack.artworkURL)
        nameLabel.text = session.name
        titleLabel.text = session.currentTrack.title
        genresLabel.text = String(session.genres.count)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.cornerRadius = 12
    }
}
