//
//  ProductServiceTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/05/23.
//

import XCTest
@testable import GoPizza

final class ProductServiceTests: XCTestCase {
    var sut: ProductService!

    override func setUpWithError() throws {
        sut = ProductService.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetAllProductSucess() {
        let expectation = XCTestExpectation(description: "get all products")

        sut.getAllProduct { result in
            switch result {
            case .success(let products):
                XCTAssertGreaterThan(products.count, 0, "Product list should not be empty")
                expectation.fulfill()
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 2)
    }

    func testGetAllProductFailureUrlInvalid() {
        let expectation = XCTestExpectation(description: "get all products")
        sut.url = ""
        sut.getAllProduct { result in
            switch result {
            case .success:
                XCTFail("Expected error, but received a success result")
            case .failure(let failure):
                XCTAssertEqual(failure, .urlInvalid, "Error should be urlInvalid")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 2)
    }

    func testGetAllProductFailureNoDataAvariable() {
        let expectation = XCTestExpectation(description: "get all products")
        sut.url = "http://url.com"
        sut.getAllProduct { result in
            switch result {
            case .success:
                XCTFail("Expected error, but received a success result")
            case .failure(let failure):
                XCTAssertEqual(failure, .noDataAvariable, "Error should be noDataAvariable")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 2)
    }

    func testGetAllProductFailureNoProcessData() {
        let expectation = XCTestExpectation(description: "get all products")
        sut.url = "https://run.mocky.io/v3/e928f0d1-6ed1-4770-9e1e-c56d7d5acdd8"
        sut.getAllProduct { result in
            switch result {
            case .success:
                XCTFail("Expected error, but received a success result")
            case .failure(let failure):
                XCTAssertEqual(failure, .noProcessData, "Error should be noProcessData")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 2)
    }
}
