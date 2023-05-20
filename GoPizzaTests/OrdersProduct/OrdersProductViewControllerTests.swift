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
    private var ordersPizzaViewCollaboration: OrdersPizzaView!

    override func setUpWithError() throws {
        ordersPizzaViewCollaboration = OrdersPizzaView()
        sut = .init(container: ordersPizzaViewCollaboration)
    }

    override func tearDownWithError() throws {
        sut = nil
        ordersPizzaViewCollaboration = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrdersPizzaView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
