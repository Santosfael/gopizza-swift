//
//  ProductService.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

final class ProductService: ProductServiceProtocol {

    var url = "https://run.mocky.io/v3/a5088a14-a95d-43e0-9e14-cf851d1ca37c"

    static var shared: ProductService {
        let apiInstance = ProductService()
        return apiInstance
    }

    let session = URLSession.shared

    func getAllProduct(completion: @escaping (Result<[Product], ResponseError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid)) }

        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvariable)) }

                let decoder = JSONDecoder()
                let repoResponse = try decoder.decode([Product].self, from: jsonData)
                completion(.success(repoResponse))
            } catch {
                completion(.failure(.noProcessData))
            }
        }

        dataTask.resume()
    }
}
