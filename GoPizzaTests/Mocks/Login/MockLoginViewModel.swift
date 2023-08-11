//
//  MockLoginViewModel.swift
//  GoPizzaTests
//
//  Created by Rafael Rocha on 03/03/23.
//

import Foundation
@testable import GoPizza

class MockLoginViewModel: LoginViewModelProtocol {
    var loginService: LoginServiceProtocol
    var didCallLogin = false
    
    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    func login(user: User, completion: @escaping (Result<GoPizza.User, GoPizza.RequestError>) -> Void) {
        didCallLogin = true
        let error = RequestError.error("E-mail ou senha inválido")
        completion(.success(user))
        completion(.failure(error))
    }
}
