//
//  AlbumsApi.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation

import Foundation

enum AlbumsApi {
    case feed(page: Int, count: Int)
}

extension AlbumsApi: RequestBuilder {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }

    var path: String {
        return "5df79b1f320000f4612e011e"
    }

    var endpoint: URL {
        return URL(string: "\(baseURL)\(path)")!
    }

    var method: HttpMethod {
        return .get
    }

    var request: URLRequest {
        switch self {
        case let .feed(prm):
//            let prmDic = [
////                "page": prm.page,
////                "count": prm.count,
//            ] as [String: Any]
            var items = [URLQueryItem]()
            var myURL = URLComponents(string: endpoint.absoluteString)
//            for (key, value) in prmDic {
//                items.append(URLQueryItem(name: key, value: "\(value)"))
//            }
            myURL?.queryItems = items
            var request = URLRequest(url: myURL!.url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 30)
            
            request.httpMethod = method.rawValue
            return URLRequest(url: endpoint)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
}
