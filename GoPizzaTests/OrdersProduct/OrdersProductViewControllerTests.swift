//
//  OrdersProductViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrdersProductViewControllerTests: XCTestCase {
    private var sut: OrdersProductViewController!
    private var ordersProductViewCollaboration: OrdersProductView!

    override func setUpWithError() throws {
        ordersProductViewCollaboration = OrdersProductView()
        sut = .init(container: ordersProductViewCollaboration)
    }

    override func tearDownWithError() throws {
        sut = nil
        ordersProductViewCollaboration = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrdersProductView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
