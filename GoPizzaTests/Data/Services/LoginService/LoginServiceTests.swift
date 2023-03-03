//
//  LoginServiceTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 02/03/23.
//

import XCTest
@testable import GoPizza

final class LoginServiceTests: XCTestCase {
    private var sut: LoginServiceProtocol!

    override func setUpWithError() throws {
        sut = LoginService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoginSuccess() {
        let user = User(email: "user@email.com", password: "password")
        let expectation = XCTestExpectation(description: "Login success")
        sut.login(user: user) { result in
            switch result {
            case .success(let isSuccess):
                XCTAssertTrue(isSuccess)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }

    func testLoginFailure() {
        let user = User(email: "invalid@email.com", password: "password")
        let expectation = XCTestExpectation(description: "Login failure")
        sut.login(user: user) { result in
            switch result {
            case .success(let isSuccess):
                XCTAssertFalse(isSuccess)
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "E-mail ou senha invalido")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
