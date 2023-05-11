//
//  ProductServiceMock.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 01/05/23.
//

import Foundation
@testable import GoPizza

final class ProductServiceMock: ProductServiceProtocol {
    var getAppProductCompletion: ((Result<[Product], ResponseError>) -> Void)?
    func getAllProduct(completion: @escaping (Result<[GoPizza.Product], GoPizza.ResponseError>) -> Void) {
        getAppProductCompletion = completion
    }
}
