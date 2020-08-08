//
//  APIClient.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//
import Foundation
import Foundation

final class Page {
    var currentPage: Int = 0
    var maxPages: Int = 10
    var countPerPage: Int = 15
    var isFetchingData = false
    var fetchedItemsCount = 0
    var shouldLoadMore: Bool {
        (currentPage < maxPages) && (!isFetchingData)
    }
}

protocol Pageable {
    func loadCells(for indexPaths: [IndexPath])
}
