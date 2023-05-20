//
//  String+extensions.swift
//  GoPizza
//
//  Created by Rafael Rocha on 30/03/23.
//

import Foundation

extension String {
    enum ValidateType {
        case fullName
        case email
        case password
    }

    enum Regex: String {
        case fullName = "^[a-zA-Z]{4,}(?: [a-zA-Z]+){1,5}$"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    }

    func isValid(_ validateType: ValidateType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""

        switch validateType {
        case .fullName:
            regex = Regex.fullName.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
