//
//  OrderPizzaViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderPizzaViewControllerTests: XCTestCase {
    private var sut: OrderPizzaViewController!
    private var orderPizzaViewCollaboration: OrderPizzaView!

    override func setUpWithError() throws {
        sut = .init()
        sut.view = orderPizzaViewCollaboration
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrderPizzaView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
