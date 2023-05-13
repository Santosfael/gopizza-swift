//
//  PizzasTableViewCellTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest
@testable import GoPizza

final class ProductTableViewCellTests: XCTestCase {
    private var sut: ProductTableViewCell!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPizzaImageNotNil() {
        do {
            let pizzaImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "ProductTableViewCell.productImage"}) as? UIImageView)
            XCTAssertNotNil(pizzaImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testNamePizzaNotNil() {
        do {
            let namePizza = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "ProductTableViewCell.productNameLabel"}) as? UILabel)
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
