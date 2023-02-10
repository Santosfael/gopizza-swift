//
//  Coordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get }
    var navigationController: UINavigationController { get set }
    func start()
    func presentNextStep()
    func presentPreviousStep()
    func presentOtherStep()
}

extension CoordinatorProtocol {
    func presentNextStep() {}
    func presentPreviousStep() {}
    func presentOtherStep() {}
}
