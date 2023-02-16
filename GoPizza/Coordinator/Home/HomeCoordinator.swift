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
        let ordersPizzaCoordinator = OrderPizzaCoordinator(navigationController, parentCoordinator: self)
        childCoordinators.append(ordersPizzaCoordinator)
        ordersPizzaCoordinator.start()
    }

    func presentPreviousStep() {
        navigationController.popViewController(animated: true)
    }
}
