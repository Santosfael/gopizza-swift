//
//  LoginViewDelegate.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    func didTapLogin(user: User)
    func didTapForgot()
}
