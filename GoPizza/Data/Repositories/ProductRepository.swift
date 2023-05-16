//
//  ProductRepository.swift
//  GoPizza
//
//  Created by Rafael Rocha on 14/05/23.
//

import Foundation

class ProductReposity {
    static let shared = ProductReposity()
    var product: Product?
    func setProduct(product: Product) {
        self.product = product
    }

    func getProduct() -> Product? {
        return product
    }
}
