//
//  OrderPizzaViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderPizzaViewTests: XCTestCase {
    private var sut: OrderPizzaView!

    override func setUpWithError() throws {
        sut = OrderPizzaView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testOrderPizzaViewPizzaImage() {
        do {
            let pizzaImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderPizzaView.pizzaImageView"}) as? UIImageView)
            XCTAssertNotNil(pizzaImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrderPizzaViewNamePizzaLabel() {
        do {
            let namePizzaLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderPizzaView.namePizzaLabel"}) as? UILabel)
            XCTAssertEqual(namePizzaLabel.text, "Margherita")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOrdePizzaViewTitleSelectSizePizzaLabel() {
        do {
            let titleSizePizzaLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderPizzaView.titleSelectSizePizzaLabel"}) as? UILabel)
            XCTAssertEqual(titleSizePizzaLabel.text, "Selecione um tamanho")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
