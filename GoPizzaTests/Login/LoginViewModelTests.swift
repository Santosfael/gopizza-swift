//
//  LoginViewModelTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 02/03/23.
//

import XCTest
@testable import GoPizza

final class LoginViewModelTests: XCTestCase {
    private var loginServiceCollaboration: LoginServiceProtocol!
    private var sut: LoginViewModelProtocol!
    

    override func setUpWithError() throws {
        loginServiceCollaboration = LoginService()
        sut = LoginViewModel(loginService: loginServiceCollaboration)
    }

    override func tearDownWithError() throws {
        loginServiceCollaboration = nil
        sut = nil
    }

    func testLoginSucess() {
        let expectation = XCTestExpectation(description: "Login success")
        sut.login(user: User(email: "user@email.com", password: "password")) { result in
            switch result {
            case .success(let isSuccess):
                XCTAssertTrue(isSuccess)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    func testLoginFailure() {
        let expetation = XCTestExpectation(description: "Login failure")
        sut.login(user: User(email: "invalid@email.com", password: "password")) { result in
            switch result {
            case .success(_):
                XCTFail("Login should ot sucessd")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "E-mail ou senha invalido")
                expetation.fulfill()
            }
        }
    }
}
