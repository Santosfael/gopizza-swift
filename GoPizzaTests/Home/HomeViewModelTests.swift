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

    func testListProductByNameWhenMatchingProductNameShouldReturnFilteredProducts() {
        let products = createTestProducts()
        let productName = "Portuguesa"
        let filteredProducts = sut.listProductByName(productName, products)

        XCTAssertEqual(filteredProducts.count, 1)
        XCTAssertEqual(filteredProducts.first?.name, productName)
    }

    func testListProductByNameWhenNoMatchingProductNameShouldReturnAllProducts() {
        let products = createTestProducts()
        let productName = "Frango"
        let filteredProducts = sut.listProductByName(productName, products)

        XCTAssertEqual(filteredProducts.count, 3)
    }

    func testListProductByNameWhenEmptyProductNameShouldReturnAllProducts() {
        let products = createTestProducts()
        let productName = ""
        let filteredProducts = sut.listProductByName(productName, products)

        XCTAssertEqual(filteredProducts.count, 3)
    }

    func createTestProducts() -> [Product] {
        let price = Price(small: 30, medium: 45, big: 60);
        let product1 = Product(id: "", photo_url: "", name: "Portuguesa", description: "Calabresa, ovo e pimentão cobertos com mussarela.", price: price)
        let product2 = Product(id: "", photo_url: "", name: "Margherita", description: "Mussarela, manjericão fresco, parmesão e tomate.", price: price)
        let product3 = Product(id: "", photo_url: "", name: "4 Queijos", description: "Mussarela, provolone, parmesão e gorgonzola.", price: price)
            return [product1, product2, product3]
        }
}
