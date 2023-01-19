//
//  LoginViewTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 17/01/23.
//

import XCTest
@testable import GoPizza

final class LoginViewTests: XCTestCase {
    private var sut: LoginView!

    override func setUpWithError() throws {
        sut = LoginView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoginViewLogoImage() {
        do {
            let logoImage = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "LoginView.logoImage"}) as? UIImageView)
            XCTAssertNotNil(logoImage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testLoginViewTitleLabelText() {
        do {
            let titleLabel = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "LoginView.titleLabel"}) as? UILabel)
            XCTAssertEqual(titleLabel.text, "Login")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testLoginViewEmailTextField() {
        do {
            let stackView = try XCTUnwrap(sut.subviews.first(where: {$0.accessibilityIdentifier == "LoginView.stackView"}) as? UIStackView)
            let emailTextField = try XCTUnwrap(stackView.subviews.first(where: {$0.accessibilityIdentifier == "LoginView.emailTextField"}) as? UITextField)
            XCTAssertEqual(emailTextField.placeholder, "E-mail")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
