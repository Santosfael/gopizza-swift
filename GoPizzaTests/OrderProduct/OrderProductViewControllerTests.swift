//
//  OrderProductViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/02/23.
//

import XCTest
@testable import GoPizza

final class OrderProductViewControllerTests: XCTestCase {
    private var sut: OrderProductViewController!
    private var orderProductViewCollaboration: OrderProductView!
    private var coodinatorStub: CoordinatorProtocolStub!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coodinatorStub = .init(navigationController)
        sut = .init(coordinator: coodinatorStub)
        sut.view = orderProductViewCollaboration
    }

    override func tearDownWithError() throws {
        sut = nil
        coodinatorStub = nil
        navigationController = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrderProductView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func testDidTapCheckout() {
        sut.didCheckout()
        XCTAssertTrue(coodinatorStub.presentPreviousStepCalled)
    }
}
