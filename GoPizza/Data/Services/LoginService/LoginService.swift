//
//  LoginService.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

final class LoginService: LoginServiceProtocol {
    func login(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let isSuccess = user.email == "user@email.com" && user.password == "password"
            if isSuccess {
                completion(.success(true))
            } else {
                let error = NSError(domain: "LoginService", code: 404, userInfo: [NSLocalizedDescriptionKey: "E-mail ou senha invalido"])
                completion(.failure(error))
            }
        }
    }
}
