//
//  LoginViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 07/01/23.
//

import XCTest
@testable import GoPizza

final class LoginViewControllerTests: XCTestCase {
    private var coordinatorStub: CoordinatorProtocolStub!
    private var navigationController: UINavigationController!
    private var mockLoginViewModel: MockLoginViewModel!
    private var loginServiceCollaboration: LoginServiceProtocol!

    private var sut: LoginViewController!
    private var loginViewColaboration: LoginView!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        loginServiceCollaboration = LoginService()
        mockLoginViewModel = MockLoginViewModel(loginService: loginServiceCollaboration)
        sut = .init(coordinator: coordinatorStub, viewModel: mockLoginViewModel)
        sut.view = loginViewColaboration
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        coordinatorStub = nil
        mockLoginViewModel = nil
        loginServiceCollaboration = nil
    }

    func testLoadingView() throws {
        XCTAssertTrue(sut.view is LoginView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func testDidTapLoginWithValidUser() {
        let user = User(email: "user@email.com", password: "password")
        sut.didTapLogin(user: user) {
            XCTAssertTrue(self.coordinatorStub.presentNextStepCalled)
        }
    }

    func testDidTapLoginWithInvalidUser() {
        let user = User(email: "user@example.com", password: "password")
        sut.didTapLogin(user: user) {
            XCTAssertTrue(self.mockLoginViewModel.didCallLogin)
        }
    }

    func testDidTapForgot() {
        sut.didTapForgot()
    }
}
