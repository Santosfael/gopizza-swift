//
//  OrderProductViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderProductViewControllerTests: XCTestCase {
    private var sut: OrderProductViewController!
    private var orderProductViewCollaboration: OrderProductView!

    override func setUpWithError() throws {
        sut = .init()
        sut.view = orderProductViewCollaboration
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrderProductView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
