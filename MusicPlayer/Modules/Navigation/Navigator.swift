//
//  Navigator.swift
//  MusicPlayer
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation

import UIKit

protocol Navigator {
    func push(_ dest: Destination)
}

/// once app navigator is intialized,
///  it have a root controller to do all navigation on till it recieve new root
final class AppNavigator: Navigator {
    private static var navigationController: UINavigationController!
    @discardableResult
    init(window: UIWindow) {
        AppNavigator.navigationController = UINavigationController(rootViewController: Destination.albums.controller)
        AppNavigator.navigationController?.navigationBar.prefersLargeTitles = true
        window.rootViewController = AppNavigator.navigationController
        window.makeKeyAndVisible()
    }

    init() throws {
        if AppNavigator.navigationController == nil {
            throw NavigatorError.noRoot
        }
    }

    func push(_ dest: Destination) {
        AppNavigator.navigationController.pushViewController(dest.controller, animated: true)
    }
}

enum NavigatorError: Error {
    case noRoot
}
