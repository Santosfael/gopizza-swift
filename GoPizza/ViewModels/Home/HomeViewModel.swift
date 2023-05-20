//
//  HomeViewModel.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    internal var productService: ProductServiceProtocol

    init(productService: ProductServiceProtocol) {
        self.productService = productService
    }
    
    func listAllProducts(productName: String? = nil, completion: @escaping (Result<[Product], ResponseError>) -> Void) {
        productService.getAllProduct(completion: completion)
    }
}
