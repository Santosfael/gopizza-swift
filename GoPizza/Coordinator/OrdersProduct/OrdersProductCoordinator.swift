//
//  OrdersProductCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 05/06/23.
//

import Foundation
import UIKit

protocol OrdersProductCoordinatorProtocol: AnyObject {
    var parentCoordinator: HomeCoordinator { get set }
}

final class OrdersProductCoordinator: CoordinatorProtocol, OrdersProductCoordinatorProtocol {
    internal var childCoordinators: [CoordinatorProtocol] = []

    internal var navigationController: UINavigationController
    internal var parentCoordinator: HomeCoordinator

    init(_ navigationController: UINavigationController,
         parentCoordinator: HomeCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let ordersProductViewController = OrdersProductViewController(coordinator: self)
        navigationController.pushViewController(ordersProductViewController, animated: true)
    }

    func presentPreviousStep() {
        navigationController.popViewController(animated: true)
    }
}
