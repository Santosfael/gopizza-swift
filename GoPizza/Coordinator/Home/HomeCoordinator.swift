//
//  HomeCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
    var parentCoordinator: LoginCoordinator { get set }
}
final class HomeCoordinator: CoordinatorProtocol, HomeCoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    
    internal var navigationController: UINavigationController
    internal var parentCoordinator: LoginCoordinator
    
    init(_ navigationController: UINavigationController,
         parentCoordinator: LoginCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let homeViewController = HomeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }

    func presentNextStep() {
        let orderProductCoordinator = OrderProductCoordinator(navigationController, parentCoordinator: self)
        childCoordinators.append(orderProductCoordinator)
        orderProductCoordinator.start()
    }

    func presentPreviousStep() {
        navigationController.popViewController(animated: true)
    }

    func presentOtherStep() {
        let ordersProductCoordinator = OrdersProductCoordinator(navigationController, parentCoordinator: self)
        childCoordinators.append(ordersProductCoordinator)
        ordersProductCoordinator.start()
    }
}
