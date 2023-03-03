//
//  User.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
