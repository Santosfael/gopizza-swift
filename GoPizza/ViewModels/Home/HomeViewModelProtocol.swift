//
//  HomeViewModelProtocol.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var productService: ProductServiceProtocol { get set }
    func listAllProducts(productName: String?, completion:@escaping (Result<[Product], ResponseError>) -> Void)
    func setProduct(product: Product)
}
