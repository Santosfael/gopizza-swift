//
//  LoginServiceProtocol.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

typealias completion = (Result<User, RequestError>) -> Void

protocol LoginServiceProtocol: AnyObject {
    func login(user: User, completion: @escaping completion)
    func logout()
}
