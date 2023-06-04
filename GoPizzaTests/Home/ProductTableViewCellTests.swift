//
//  ProductTableViewCellTests.swift
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

    func testProductImageNotNil() {
        do {
            let productImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "ProductTableViewCell.productImage"}) as? UIImageView)
            XCTAssertNotNil(productImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testNameProductNotNil() {
        do {
            let nameProduct = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "ProductTableViewCell.productNameLabel"}) as? UILabel)
            XCTAssertNotNil(nameProduct)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
