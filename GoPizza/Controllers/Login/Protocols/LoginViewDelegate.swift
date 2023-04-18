//
//  LoginViewDelegate.swift
//  GoPizza
//
//  Created by Rafael Rocha on 10/02/23.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    func didTapLogin(user: User, completion: @escaping () -> Void)
    func didTapForgot()
}
