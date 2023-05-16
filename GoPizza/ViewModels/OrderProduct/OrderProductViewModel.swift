//
//  OrderProductViewModel.swift
//  GoPizza
//
//  Created by Rafael Rocha on 14/05/23.
//

import Foundation

final class OrderProductViewModel: OrderProductViewModelProtocol {

    let productRepository = ProductReposity.shared

    func getProduct() -> Product? {
        return productRepository.getProduct()
    }
}
