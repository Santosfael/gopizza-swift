//
//  AppCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    private var navigationController: UINavigationController

    init(window: UIWindow,
         navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    func start() {
        let loginCoordinator = LoginCoordinator(navigationController)
        loginCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
