//
//  OrderProducViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderProducViewTests: XCTestCase {
    private var sut: OrderProductView!

    override func setUpWithError() throws {
        sut = OrderProductView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func testOrderProductViewImage() {
        do {
            let productImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.productImageView"}) as? UIImageView)
            XCTAssertNotNil(productImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrderProductViewNameLabel() {
        do {
            let nameProductLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.nameProductLabel"}) as? UILabel)
            XCTAssertEqual(nameProductLabel.text, "Margherita")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrdeProductViewTitleSelectSizeLabel() {
        do {
            let titleSizeProductLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.titleSelectSizeProductLabel"}) as? UILabel)
            XCTAssertEqual(titleSizeProductLabel.text, "Selecione um tamanho")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
