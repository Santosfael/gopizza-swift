//
//  OrdersProductViewControllerTests.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 10/02/23.
//

import XCTest
@testable import GoPizza

final class OrdersProductViewControllerTests: XCTestCase {
    private var sut: OrdersProductViewController!
    private var ordersProductViewCollaboration: OrdersProductView!
    private var coordinatorStub: CoordinatorProtocolStub!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinatorStub = .init(navigationController)
        ordersProductViewCollaboration = OrdersProductView()
        sut = .init(container: ordersProductViewCollaboration, coordinator: coordinatorStub)
    }

    override func tearDownWithError() throws {
        sut = nil
        ordersProductViewCollaboration = nil
        navigationController = nil
        coordinatorStub = nil
    }

    func testLoadingView() {
        XCTAssertTrue(sut.view is OrdersProductView)
    }

    func testInitCoder() {
        sut = .init(coder: NSCoder())
        XCTAssertNil(sut)
    }
}
