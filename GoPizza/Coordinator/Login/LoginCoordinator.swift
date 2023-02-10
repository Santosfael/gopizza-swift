//
//  LoginCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

final class LoginCoordinator: CoordinatorProtocol {

    private var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewController = LoginViewController()
        navigationController.setViewControllers([loginViewController], animated: true)
    }
    
    func presentNextStep() {
    }
    
    func presentPreviousStep() {
    }
}
