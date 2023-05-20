//
//  OrdersProductViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrdersProductViewTests: XCTestCase {
    private var sut: OrdersPizzaView!

    override func setUpWithError() throws {
        sut = OrdersPizzaView()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testOrdersPizzaViewTitleLabelText() {
        do {
            let titleLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrdersPizzaView.titleLabel"}) as? UILabel)
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
