//
//  LoginViewModelProtocol.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    var loginService: LoginServiceProtocol { get set }
    func login(user: User, completion: @escaping (Result<User, RequestError>) -> Void)
}
