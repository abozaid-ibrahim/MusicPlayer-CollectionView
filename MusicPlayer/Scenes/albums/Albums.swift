//
//  Albums.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation

struct RecipesListResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass

struct DataClass: Codable {
    let sessions: [Session]
}

// MARK: - Session

struct Session: Codable {
    let name: String
    let listenerCount: Int
    let genres: [String]
    let currentTrack: CurrentTrack

    enum CodingKeys: String, CodingKey {
        case name
        case listenerCount = "listener_count"
        case genres
        case currentTrack = "current_track"
    }
}

// MARK: - CurrentTrack

struct CurrentTrack: Codable {
    let title: String
    let artworkURL: String

    enum CodingKeys: String, CodingKey {
        case title
        case artworkURL = "artwork_url"
    }
}
