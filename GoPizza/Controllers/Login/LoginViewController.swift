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
    private let viewModel: LoginViewModelProtocol
    
    init(container: LoginView = LoginView(),
         coordinator: CoordinatorProtocol,
         viewModel: LoginViewModelProtocol = LoginViewModel(loginService: LoginService())) {
        self.container = container
        self.coordinator = coordinator
        self.viewModel = viewModel
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        container.refreshInputTexts()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    func didTapLogin(user: User, completion: @escaping () -> Void) {
        viewModel.login(user: user) { result in
            switch result {
            case .success(_):
                self.coordinator.presentNextStep()
            case .failure(let error):
                self.showAlert(message: error.localizedDescription)
            }
            completion()
        }
    }
    
    func didTapForgot() {
    }
}
