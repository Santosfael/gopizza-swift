//
//  HomeViewDelegate.swift
//  GoPizza
//
//  Created by Rafael Rocha on 13/02/23.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func didTapSelectedProduct()
    func listTableProducts(completion: @escaping (Result<[Product], ResponseError>) -> Void)
}
