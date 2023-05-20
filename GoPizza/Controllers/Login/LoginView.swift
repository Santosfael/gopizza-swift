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

    private var errorEmailLabel: UILabel = .label(text: "Digite um e-mail válido",
                                                  font: UIFont.systemFont(ofSize: 12, weight: .regular),
                                                  textColor: UIColor(named: "Background"),
                                                  isHidden: true,
                                                  accessibilityIdentifier: "LoginView.errorEmailLabel")

    private var passwordTextField: UITextField = .textField(keybordType: .default,
                                                            textPlaceHolder: "Senha",
                                                            borderColor: UIColor(named: "BorderColor")?.cgColor,
                                                            secureTextField: true,
                                                            accessibilityIdentifier: "LoginView.passwordTextField")

    private var errorPasswordLabel: UILabel = .label(text: "Campo senha em branco",
                                                    font: UIFont.systemFont(ofSize: 12, weight: .regular),
                                                    textColor: UIColor(named: "Background"),
                                                    isHidden: true,
                                                    accessibilityIdentifier: "LoginView.errorPasswordLabel")

    private var forgotButton: UIButton = .button( title: "Esqueci a minha senha",
                                                  titleColor: .white,
                                                  titleFont: .systemFont(ofSize: 14, weight: .regular),
                                                  accessibilityIdentifier: "LoginView.forgotButton")

    private var loginButton: UIButton = .button(title: "Entrar",
                                                backgroundColor: .init(named: "Red"),
                                                titleColor: .white,
                                                isEnabled: false,
                                                alpha: 0.5,
                                                accessibilityIdentifier: "LoginView.loginButton")

    private var activityIndicator: UIActivityIndicatorView = .activityIndicator(style: .medium,
                                                                                hidesWhenStopped: true,
                                                                                isHidden: true,
                                                                                backgroundColor: .init(named: "Red"),
                                                                                clipsToBounds: true,
                                                                                color: .white,
                                                                                accessibilityIdentifier: "LoginView.activityIndicator")


    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField.text = ""
        passwordTextField.text = ""
        configBackgroundLinear()
        configShowKeyboard()
        delegates()
        errorLabels()
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

    private func delegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
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

    private func errorLabels() {
        emailTextField.addTarget(self, action: #selector(handleEmailTextChange), for: .editingDidEnd)
        passwordTextField.addTarget(self, action: #selector(handlePasswordTextChange), for: .editingChanged)
    }

    @objc private func handleEmailTextChange() {
        guard let text = emailTextField.text else { return }
        if text.isValid(.email) {
            emailTextField.backgroundColor = .clear
            errorEmailLabel.isHidden = true
        } else {
            emailTextField.backgroundColor = UIColor(red: 0.72, green: 0, blue: 0, alpha: 0.2)
            errorEmailLabel.isHidden = false
        }
    }

    @objc private func handlePasswordTextChange() {
        guard let text = passwordTextField.text else { return }
        if !text.isEmpty {
            passwordTextField.backgroundColor = .clear
            errorPasswordLabel.isHidden = true
        } else {
            passwordTextField.backgroundColor = UIColor(red: 0.72, green: 0, blue: 0, alpha: 0.2)
            errorPasswordLabel.isHidden = false
        }
    }

    private func configureSubViews() {
        addSubviews(image,
                    titleLabel,
                    stackView,
                    forgotButton,
                    loginButton,
                    activityIndicator)

        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(errorEmailLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(errorPasswordLabel)
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

        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 20),
            activityIndicator.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            activityIndicator.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            activityIndicator.heightAnchor.constraint(equalToConstant: 56)
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
        loginButton.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        delegate?.didTapLogin(user: User(email: email, password: password), completion: {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.loginButton.isHidden = false
        })
    }
}

extension LoginView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        image.isHidden = false
        self.endEditing(true)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text
        else {
            return
        }
        if emailText.isValid(.email) && !passwordText.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
}
