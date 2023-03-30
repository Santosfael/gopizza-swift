//
//  LoginView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 06/01/23.
//

import UIKit

final class LoginView: UIView {
    
    private var image: UIImageView = .imageView(image: .init(named: "logo_image"),
                                                accessibilityIdentifier: "LoginView.logoImage")

    private var stackView: UIStackView = .stack(axis: .vertical,
                                                accessibilityIdentifier: "LoginView.stackView")

    private var titleLabel: UILabel = .label(text: "Login",
                                             accessibilityIdentifier: "LoginView.titleLabel")

    private var emailTextField: UITextField = .textField(keybordType: .emailAddress,
                                                         textPlaceHolder: "E-mail",
                                                         borderColor: UIColor(named: "BorderColor")?.cgColor,
                                                         autocorrectionType: .no,
                                                         accessibilityIdentifier: "LoginView.emailTextField")

    private var passwordTextField: UITextField = .textField(keybordType: .emailAddress,
                                                            textPlaceHolder: "Senha",
                                                            borderColor: UIColor(named: "BorderColor")?.cgColor,
                                                            accessibilityIdentifier: "LoginView.passwordTextField")

    private var forgotButton: UIButton = .button( title: "Esqueci a minha senha",
                                                  titleColor: .white,
                                                  titleFont: .systemFont(ofSize: 14, weight: .regular),
                                                  accessibilityIdentifier: "LoginView.forgotButton")

    private var loginButton: UIButton = .button(title: "Entrar",
                                                backgroundColor: .init(named: "Red"),
                                                titleColor: .white,
                                                accessibilityIdentifier: "LoginView.loginButton")

    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField.text = ""
        passwordTextField.text = ""
        configBackgroundLinear()
        configShowKeyboard()
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    private func setupView() {
        configureSubViews()
        aditionalSetupButton()
        constraints()
    }

    private func configShowKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.image.isHidden = true
                self.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }

    private func configureSubViews() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(forgotButton)
        addSubview(loginButton)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            image.widthAnchor.constraint(equalToConstant: 260),
            image.heightAnchor.constraint(equalToConstant: 284)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56)
        ])

        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            forgotButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func configBackgroundLinear() {
        let bounds = UIScreen.main.bounds
        layer.addSublayer(CAGradientLayer.linearGradient(topColor: UIColor(named: "Red"),
                                                                    bottomColor: UIColor(named: "DarkRed"),
                                                                    bounds: bounds))
    }

    func refreshInputTexts() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    private func aditionalSetupButton() {
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchDown)
    }

    @objc private func didTapLoginButton() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        delegate?.didTapLogin(user: User(email: email, password: password))
    }
}

extension LoginView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        image.isHidden = false
        self.endEditing(true)
    }
}
