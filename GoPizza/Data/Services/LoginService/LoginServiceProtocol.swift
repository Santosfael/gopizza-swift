//
//  LoginServiceProtocol.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

protocol LoginServiceProtocol: AnyObject {
    func login(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
}
