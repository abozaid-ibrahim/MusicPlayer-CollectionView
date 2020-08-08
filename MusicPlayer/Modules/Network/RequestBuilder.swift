//
//  APIClient.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//
import Foundation

public protocol RequestBuilder {
    var baseURL: URL { get }

    var path: String { get }

    var method: HttpMethod { get }

    var request: URLRequest { get }

    var headers: [String: String]? { get }
}

public enum HttpMethod: String {
    case get, post
}

struct APIConstants {
    static let baseURL = "http://www.mocky.io/v2/"
}
