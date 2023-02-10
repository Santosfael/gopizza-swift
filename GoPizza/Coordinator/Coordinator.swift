//
//  Coordinator.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
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
