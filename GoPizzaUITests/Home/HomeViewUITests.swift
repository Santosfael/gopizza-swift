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
        let amoutPizzaLabel = app.staticTexts["HomeView.amountProductLabel"]
        let pizzasTableView = app.tables["HomeView.pizzasTableView"]
        let pizzaImage = app.images["PizzaTableViewCell.productImage"]
        let pizzaNameLabel = app.staticTexts["PizzaTableViewCell.productNameLabel"]
        let pizzaDescriptionLabel = app.staticTexts["PizzasTableViewCell.productDescriptionLabel"]
        XCTAssertTrue(titleMenuLabel.exists)
        XCTAssertTrue(amoutPizzaLabel.exists)
        XCTAssertTrue(pizzasTableView.exists)
        XCTAssertTrue(pizzaImage.exists)
        XCTAssertTrue(pizzaNameLabel.exists)
        XCTAssertTrue(pizzaDescriptionLabel.exists)
    }

    func testHomeViewTitleLabelText() {
        let titleMenuLabel = app.staticTexts["HomeView.titleMenuLabel"]
        XCTAssertEqual(titleMenuLabel.label, "Cardápio")
    }

    func testHomeViewTableCellImage() {
        let pizzaImage = app.images["PizzaTableViewCell.productImage"]
        XCTAssertNotNil(pizzaImage)
    }
}
