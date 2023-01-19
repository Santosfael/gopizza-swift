//
//  LoginViewUITests.swift
//  GoPizzaUITests
//
//  Created by Rafael Rocha on 17/01/23.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testLoginViewTitleLabelExists() {
        let titleLabel = app.staticTexts["LoginView.titleLabel"]
        XCTAssertTrue(titleLabel.exists)
    }

    func testLoginViewTitleLabelText() {
        let titleLabel = app.staticTexts["LoginView.titleLabel"]
        XCTAssertEqual(titleLabel.label, "Login")
    }
}
