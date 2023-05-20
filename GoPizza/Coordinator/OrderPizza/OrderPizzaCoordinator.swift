//
//  OrderPizzaCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 13/02/23.
//

import Foundation
import UIKit

protocol OrderPizzaCoordinatorProtocol: AnyObject {
    var parentCoordinator: HomeCoordinator { get set }
}

final class OrderPizzaCoordinator: CoordinatorProtocol, OrderPizzaCoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController

    internal var parentCoordinator: HomeCoordinator

    init(_ navigationController: UINavigationController,
         parentCoordinator: HomeCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let orderPizzaViewController = OrderProductViewController()
        navigationController.pushViewController(orderPizzaViewController, animated: true)
    }
}
