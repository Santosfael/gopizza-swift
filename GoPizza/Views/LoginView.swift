//
//  LoginView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 06/01/23.
//

import UIKit

final class LoginView: UIView {
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo_image")
        return image
    }()

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()

    private var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Login"
        title.textAlignment = .left
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        return title
    }()

    private var emailTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.keyboardType = .emailAddress
        text.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        text.leftViewMode = .always
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.autocorrectionType = .no
        text.autocapitalizationType = .none
        text.frame.size.height = 56
        return text
    }()

    private var passwordTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .white
        text.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.autocorrectionType = .no
        text.autocapitalizationType = .none
        text.leftViewMode = .always
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        text.frame.size.height = 56
        return text
    }()

    private var forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.frame = .zero
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Esqueci a minha senha", for: .normal)
        return button
    }()

    private var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = UIColor(named: "Red")
        button.layer.cornerRadius = 12
        return button
    }()

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
