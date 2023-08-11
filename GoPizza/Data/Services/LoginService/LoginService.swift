//
//  LoginService.swift
//  GoPizza
//
//  Created by Rafael Rocha on 28/02/23.
//

import Foundation
import FirebaseAuth

final class LoginService: LoginServiceProtocol {
    func login(user: User, completion: @escaping completion) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error = error, let _ = AuthErrorCode.Code(rawValue: error._code) {
                completion(.failure(RequestError.error("Erro ao fazer login, e-mail ou senha incorreto")))
            } else {
                completion(.success(User(email: user.email, password: "")))
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            //completion(.failure(.error("Erro ao deslogar")))
            print(signOutError)
        }
    }
}
