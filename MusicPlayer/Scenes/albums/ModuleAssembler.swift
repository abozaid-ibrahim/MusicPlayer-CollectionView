//
//  ModuleAssembler.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation
import UIKit

enum Destination {
    case albums
    var controller: UIViewController {
        switch self {
        case .albums:
            return getAlbumsController()
        }
    }
}

extension Destination {
    func getAlbumsController() -> UIViewController {
        return AlbumsController(viewModel: AlbumsViewModel())
    }
}
