//
//  HomeViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest
@testable import GoPizza

final class HomeViewControllerTests: XCTestCase {
    private var sut: HomeViewController!
    private var homeViewCollaboration: HomeView!

    override func setUpWithError() throws {
        sut = .init()
        sut.view = homeViewCollaboration
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoadinView() {
        XCTAssertTrue(sut.view is HomeView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
