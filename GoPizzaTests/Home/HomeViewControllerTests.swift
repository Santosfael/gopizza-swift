//
//  HomeViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 25/01/23.
//

import XCTest
@testable import GoPizza

final class HomeViewControllerTests: XCTestCase {
    private var sut: HomeViewController!
    private var homeViewCollaboration: HomeView!
    private var coordinatorStub: CoordinatorProtocolStub!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        sut = .init(coordinator: coordinatorStub)
        sut.view = homeViewCollaboration
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        coordinatorStub = nil
    }

    func testLoadinView() {
        XCTAssertTrue(sut.view is HomeView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func testDidTapSelectedProduct() {
        let price = Price(small: 0.00, medium: 0.00, big: 0.00)
        let product = Product(id: "", photo_url: "", name: "", description: "", price: price)
        sut.didTapSelectedProduct(product: product)
        XCTAssertTrue(coordinatorStub.presentNextStepCalled)
    }

    func testDidTapLogout() {
        _ = sut.view
        guard let logoutButton = sut.navigationItem.rightBarButtonItem else {
            XCTFail("logout button not found")
            return
        }

        UIApplication.shared.sendAction((logoutButton.action)!, to: logoutButton.target, from: nil, for: nil)
        XCTAssertTrue(coordinatorStub.presentPreviousStepCalled)
    }

    func testDidRedirectOrdersProduct() {
        sut.didTapRedirectToOrders()
        XCTAssertTrue(coordinatorStub.presentOtherStepCalled)
    }
}
