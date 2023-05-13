//
//  HomeViewModelTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/05/23.
//

import XCTest
@testable import GoPizza

final class HomeViewModelTests: XCTestCase {

    private var productServiceCollaboration: ProductServiceMock!
    private var sut: HomeViewModelProtocol!

    override func setUpWithError() throws {
        productServiceCollaboration = ProductServiceMock()
        sut = HomeViewModel(productService: productServiceCollaboration)
    }

    override func tearDownWithError() throws {
        productServiceCollaboration = nil
        sut = nil
    }

    func testGetProductSucess() {

        sut.listAllProducts(productName: nil) { result in
            switch result {
            case .success(let success):
                XCTAssertNotNil(success)
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
    }

    func testGetProductFailure() {
        let expectedError = ResponseError.noProcessData
        sut.listAllProducts(productName: nil) { result in
            switch result {
            case .success:
                XCTFail("Expected error, but received success")
            case .failure(let failure):
                XCTAssertEqual(failure.localizedDescription, expectedError.localizedDescription)
            }
        }

        productServiceCollaboration.getAppProductCompletion?(.failure(expectedError))
    }
}
