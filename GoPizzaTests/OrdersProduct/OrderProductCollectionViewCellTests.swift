//
//  OrderProductCollectionViewCellTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrderProductCollectionViewCellTests: XCTestCase {
    private var sut: OrderProductCollectionViewCell!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testProducImageNotNil() {
        do {
            let productImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductCollectionViewCell.productImage"}) as? UIImageView)
            XCTAssertNotNil(productImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testNameProductNotNil() {
        do {
            let nameProduct = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "OrderProductCollectionViewCell.nameProductLabel"}) as? UILabel)
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
