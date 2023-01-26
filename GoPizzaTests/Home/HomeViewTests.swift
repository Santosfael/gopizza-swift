//
//  HomeViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest
@testable import GoPizza

final class HomeViewTests: XCTestCase {
    private var sut: HomeView!

    override func setUpWithError() throws {
        sut = HomeView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
