//
//  OrderPizzaViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderPizzaViewTests: XCTestCase {
    private var sut: OrderProductView!

    override func setUpWithError() throws {
        sut = OrderProductView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testOrderPizzaViewPizzaImage() {
        do {
            let pizzaImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.productImageView"}) as? UIImageView)
            XCTAssertNotNil(pizzaImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrderPizzaViewNamePizzaLabel() {
        do {
            let namePizzaLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.nameProdcutLabel"}) as? UILabel)
            XCTAssertEqual(namePizzaLabel.text, "Margherita")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrdePizzaViewTitleSelectSizePizzaLabel() {
        do {
            let titleSizePizzaLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductView.titleSelectSizeProductLabel"}) as? UILabel)
            XCTAssertEqual(titleSizePizzaLabel.text, "Selecione um tamanho")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
