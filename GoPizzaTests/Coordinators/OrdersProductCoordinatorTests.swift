//
//  OrdersProductCoordinatorTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 05/06/23.
//

import XCTest
@testable import GoPizza

final class OrdersProductCoordinatorTests: XCTest {
    var coordinatorStub: CoordinatorProtocolStub!
    var navigationController: UINavigationController!
    var homeCoordinatorCollaboration: HomeCoordinator!
    var loginCoordinatorCollaboration: LoginCoordinator!
    var sut: OrdersProductCoordinator!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        loginCoordinatorCollaboration = .init(navigationController)
        homeCoordinatorCollaboration = .init(navigationController, parentCoordinator: loginCoordinatorCollaboration)
        sut = .init(navigationController, parentCoordinator: homeCoordinatorCollaboration)
    }

    override func tearDownWithError() throws {
        navigationController = nil
        coordinatorStub = nil
        sut = nil
        homeCoordinatorCollaboration = nil
        loginCoordinatorCollaboration = nil
    }

    func testStartNavigation() {
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is OrdersProductViewController)
    }

    func testPresentPreviousStep() {
        sut.presentPreviousStep()
        XCTAssertEqual(sut.childCoordinators.count, 0)
        XCTAssertEqual(navigationController.viewControllers.count, 0)
        XCTAssertNil(navigationController.topViewController)
    }
}
