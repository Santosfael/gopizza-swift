//
//  ProductServiceProtocol.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

protocol ProductServiceProtocol: AnyObject {
    func getAllProduct(completion: @escaping (Result<[Product], ResponseError>) -> Void)
}
