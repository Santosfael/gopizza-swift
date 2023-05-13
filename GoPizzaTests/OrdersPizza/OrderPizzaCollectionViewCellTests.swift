//
//  OrderPizzaCollectionViewCellTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrderPizzaCollectionViewCellTests: XCTestCase {
    private var sut: OrderProductCollectionViewCell!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPizzaImageNotNil() {
        do {
            let pizzaImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductCollectionViewCell.productImage"}) as? UIImageView)
            XCTAssertNotNil(pizzaImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testNamePizzaNotNil() {
        do {
            let namePizza = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductCollectionViewCell.nameProdcutLabel"}) as? UILabel)
            XCTAssertNotNil(namePizza)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
