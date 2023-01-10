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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackgroundLinear()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(forgotButton)
        addSubview(loginButton)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        constraints()
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
        guard let topColor = UIColor(named: "Red"),
              let bottomColor = UIColor(named: "DarkRed")
        else { return }
        let bounds = UIScreen.main.bounds
        layer.addSublayer(CAGradientLayer.linearGradient(topColor: topColor,
                                                         bottomColor: bottomColor,
                                                         bounds: bounds))
    }
}
