//
//  LoginViewModel.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

final class LoginViewModel: LoginViewModelProtocol {
    var loginService: LoginServiceProtocol

    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    func login(user: User, completion: @escaping (Result<User, RequestError>) -> Void) {
        loginService.login(user: user, completion: completion)
    }
}
