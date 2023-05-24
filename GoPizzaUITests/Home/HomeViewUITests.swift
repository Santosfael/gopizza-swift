//
//  HomeViewUITests.swift
//  GoPizzaUITests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testVariablesExists() {
        let titleMenuLabel = app.staticTexts["HomeView.titleMenuLabel"]
        let amoutProductLabel = app.staticTexts["HomeView.amountProductLabel"]
        let productsTableView = app.tables["HomeView.productsTableView"]
        let productImage = app.images["ProductTableViewCell.productImage"]
        let productNameLabel = app.staticTexts["ProductTableViewCell.productNameLabel"]
        let productDescriptionLabel = app.staticTexts["ProductTableViewCell.productDescriptionLabel"]
        XCTAssertTrue(titleMenuLabel.exists)
        XCTAssertTrue(amoutProductLabel.exists)
        XCTAssertTrue(productsTableView.exists)
        XCTAssertTrue(productImage.exists)
        XCTAssertTrue(productNameLabel.exists)
        XCTAssertTrue(productDescriptionLabel.exists)
    }

    func testHomeViewTitleLabelText() {
        let titleMenuLabel = app.staticTexts["HomeView.titleMenuLabel"]
        XCTAssertEqual(titleMenuLabel.label, "Cardápio")
    }

    func testHomeViewTableCellImage() {
        let productImage = app.images["ProductTableViewCell.productImage"]
        XCTAssertNotNil(productImage)
    }
}
