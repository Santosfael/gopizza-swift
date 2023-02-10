//
//  LoginCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

final class LoginCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewController = LoginViewController(coordinator: self)
        navigationController.setViewControllers([loginViewController], animated: true)
    }
    
    func presentNextStep() {
        let homeCoordinator = HomeCoordinator(navigationController, parentCoordinator: self)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
    
    func presentPreviousStep() {
    }
}
