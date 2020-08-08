//
//  MusicPlayerTests.swift
//  MusicPlayerTests
//
//  Created by abuzeid on 07.08.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

@testable import MusicPlayer
import RxSwift
import XCTest

final class MusicPlayerTests: XCTestCase {
    var viewModel: AlbumsViewModelType!
    override func setUpWithError() throws {
        //viewModel = AlbumsViewModel(apiClient: MockedSuccessApi())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testLoadingDataSuccessfully() throws {
    }
}
