//
//  HomeCoordinatorTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 14/02/23.
//

import XCTest
@testable import GoPizza

final class HomeCoordinatorTests: XCTestCase {
    var coordinatorStub: CoordinatorProtocolStub!
    var navigationController: UINavigationController!
    var orderCoordinatorCollaboration: OrderProductCoordinator!
    var loginCoordinatorCollaboration: LoginCoordinator!
    var sut: HomeCoordinator!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        loginCoordinatorCollaboration = .init(navigationController)
        sut = HomeCoordinator(navigationController, parentCoordinator: loginCoordinatorCollaboration)
        orderCoordinatorCollaboration = .init(navigationController, parentCoordinator: sut)
    }

    override func tearDownWithError() throws {
        navigationController = nil
        coordinatorStub = nil
        sut = nil
        loginCoordinatorCollaboration = nil
        orderCoordinatorCollaboration = nil
    }

    func testStartNavigation() {
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is HomeViewController)
    }

    func testPresentNextStep() {
        sut.presentNextStep()
        XCTAssertEqual(sut.childCoordinators.count, 1)
        XCTAssertTrue(navigationController.topViewController is OrderProductViewController)
    }

    func testPresentPreviousStep() {
        sut.presentPreviousStep()
        XCTAssertEqual(sut.childCoordinators.count, 0)
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testPresentOtherStep() {
        sut.presentOtherStep()
        coordinatorStub.presentOtherStep()
        XCTAssertEqual(navigationController.viewControllers.count,1)
        XCTAssertTrue(navigationController.topViewController is OrdersProductViewController)
        XCTAssertEqual(sut.childCoordinators.count, 1)
        XCTAssertTrue(coordinatorStub.presentOtherStepCalled)
    }
}
