//
//  OrderPizzaCoordinatorTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 14/02/23.
//

import XCTest
@testable import GoPizza

class OrderPizzaCoordinatorTests: XCTestCase {
    var coordinatorStub: CoordinatorProtocolStub!
    var navigationController: UINavigationController!
    var loginCoordinatorCollaboration: LoginCoordinator!
    var homeCoordinatorCollaboration: HomeCoordinator!
    var sut: OrderPizzaCoordinator!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        loginCoordinatorCollaboration = .init(navigationController)
        homeCoordinatorCollaboration = .init(navigationController, parentCoordinator: loginCoordinatorCollaboration)
        sut = OrderPizzaCoordinator(navigationController, parentCoordinator: homeCoordinatorCollaboration)
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
        XCTAssertTrue(navigationController.topViewController is OrderPizzaViewController)
    }
}
