//
//  APIClient.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//
import Foundation
enum NetworkFailure: LocalizedError {
    case generalFailure, failedToParseData, connectionFailed
    var errorDescription: String? {
        switch self {
        case .failedToParseData:
            return "Technical Difficults, we can't fetch the data"
        default:
            return "Check your connectivity"
        }
    }
}
