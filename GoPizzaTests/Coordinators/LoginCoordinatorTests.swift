//
//  LoginCoordinatorTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 14/02/23.
//

import XCTest
@testable import GoPizza

final class LoginCoordinatorTests: XCTestCase {
    var coordinatorStub: CoordinatorProtocolStub!
    var navigationController: UINavigationController!
    var homeCoordinatorCollaboration: HomeCoordinator!
    var sut: LoginCoordinator!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        sut = LoginCoordinator(navigationController)
        homeCoordinatorCollaboration = .init(navigationController, parentCoordinator: sut)
    }

    override func tearDownWithError() throws {
        navigationController = nil
        coordinatorStub = nil
        sut = nil
        homeCoordinatorCollaboration = nil
    }

    func testStartNavigation() {
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is LoginViewController)
    }

    func testPresentNextStep() {
        sut.presentNextStep()
        XCTAssertEqual(sut.childCoordinators.count, 1)
        XCTAssertTrue(navigationController.topViewController is HomeViewController)
    }
}
