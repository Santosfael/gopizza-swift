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

    private var sut: LoginViewController!
    private var loginViewColaboration: LoginView!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        sut = .init(coordinator: coordinatorStub)
        sut.view = loginViewColaboration
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        coordinatorStub = nil
    }

    func testLoadingView() throws {
        XCTAssertTrue(sut.view is LoginView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
