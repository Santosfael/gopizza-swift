//
//  HomeCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

protocol homeCoordinatorProtocol: AnyObject {
    var parentCoordinator: LoginCoordinator { get set }
}
final class HomeCoordinator: CoordinatorProtocol, homeCoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    
    internal var navigationController: UINavigationController
    internal var parentCoordinator: LoginCoordinator
    
    init(_ navigationController: UINavigationController,
         parentCoordinator: LoginCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
