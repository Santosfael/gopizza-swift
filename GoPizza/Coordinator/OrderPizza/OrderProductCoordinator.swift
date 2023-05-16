//
//  OrderProductCoordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 13/02/23.
//

import Foundation
import UIKit

protocol OrderProductCoordinatorProtocol: AnyObject {
    var parentCoordinator: HomeCoordinator { get set }
}

final class OrderProductCoordinator: CoordinatorProtocol, OrderProductCoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController

    internal var parentCoordinator: HomeCoordinator

    init(_ navigationController: UINavigationController,
         parentCoordinator: HomeCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let orderProductViewController = OrderProductViewController()
        navigationController.pushViewController(orderProductViewController, animated: true)
    }
}
