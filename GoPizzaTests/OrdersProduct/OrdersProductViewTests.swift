//
//  OrdersProductViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrdersProductViewTests: XCTestCase {
    private var sut: OrdersProductView!

    override func setUpWithError() throws {
        sut = OrdersProductView()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testOrdersProductViewTitleLabelText() {
        do {
            let titleLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrdersProductView.titleLabel"}) as? UILabel)
            XCTAssertEqual(titleLabel.text, "Pedidos Feitos")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
