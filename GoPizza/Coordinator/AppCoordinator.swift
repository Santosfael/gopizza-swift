//
//  AppCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let window: UIWindow
    internal var navigationController: UINavigationController

    init(window: UIWindow,
         navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    func start() {
        let loginCoordinator = LoginCoordinator(navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
