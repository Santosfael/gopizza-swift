//
//  HomeViewModel.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {

    internal var productService: ProductServiceProtocol
    let productRepository = ProductReposity.shared

    init(productService: ProductServiceProtocol) {
        self.productService = productService
    }
    
    func listAllProducts(productName: String? = nil, completion: @escaping (Result<[Product], ResponseError>) -> Void) {
        productService.getAllProduct(completion: completion)
    }

    func setProduct(product: Product) {
        productRepository.setProduct(product: product)
    }

    func listProductByName(_ productName: String, _ products: [Product]) -> [Product] {
        let productsFilter = products.filter { product in
            product.name.range(of: productName, options: .caseInsensitive) != nil
        }

        if productsFilter.count == 0 {
            return products
        }

        return productsFilter
    }
}
