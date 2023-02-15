//
//  CoordinatorProtocolStub.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 14/02/23.
//

import Foundation
@testable import GoPizza
import UIKit

final class CoordinatorProtocolStub: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController

    var startCalled: Bool = false
    var presentNextStepCalled: Bool = false
    var presentPreviousStepCalled: Bool = false
    var presentOtherStepCalled: Bool = false

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        startCalled = true
    }

    func presentNextStep() {
        presentNextStepCalled = true
    }

    func presentPreviousStep() {
        presentPreviousStepCalled = true
    }

    func presentOtherStep() {
        presentOtherStepCalled = true
    }
}
