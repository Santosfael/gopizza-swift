//
//  PizzasTableViewCellTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest
@testable import GoPizza

final class PizzasTableViewCellTests: XCTestCase {
    private var sut: PizzasTableViewCell!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
