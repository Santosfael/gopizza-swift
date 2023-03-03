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
    
    func login(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        didCallLogin = true
        let error = NSError(domain: "MockLoginViewModel", code: 404, userInfo: [NSLocalizedDescriptionKey: "E-mail ou senha invalido"])
        completion(.success(true))
        completion(.failure(error))
    }
}
