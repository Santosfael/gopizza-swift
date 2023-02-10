//
//  LoginViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 06/01/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private var container: LoginView
    private var coordinator: CoordinatorProtocol
    
    init(container: LoginView = LoginView(),
         coordinator: CoordinatorProtocol) {
        self.container = container
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        container.delegate = self
        view = container
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginViewController: LoginViewDelegate {
    func didTapLogin() {
        coordinator.presentNextStep()
    }
    
    func didTapForgot() {
    }
    
    
}
