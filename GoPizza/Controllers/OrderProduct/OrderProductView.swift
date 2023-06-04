//
//  OrderProductView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 26/01/23.
//

import UIKit

final class OrderProductView: UIView {

    private let headerViewHeight: CGFloat = 172
    private var quantityProductText: String = ""

    private var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var productImageView: UIImageView = .imageView(image: .init(named: "pizza"),
                                                           contentMode: .scaleToFill,
                                                           accessibilityIdentifier: "OrderProductView.productImageView")

    private var nameProductLabel: UILabel = .label(text: "Margherita",
                                                   font: .systemFont(ofSize: 32, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .center,
                                                   accessibilityIdentifier: "OrderProductView.nameProductLabel")

    private var titleSelectSizeProductLabel: UILabel = .label(text: "Selecione um tamanho",
                                                              font: .systemFont(ofSize: 14, weight: .regular),
                                                              textColor: .init(named: "TitleColor"),
                                                              textAlignment: .left,
                                                              accessibilityIdentifier: "OrderProductView.titleSelectSizeProductLabel")

    private var buttonsSizeProductStack: UIStackView = .stack(axis: .horizontal,
                                                              distribution: .fillEqually,
                                                              alignment: .center,
                                                              contentMode: .center)

    private var tableNumberLabel: UILabel = .label(text: "Número da mesa",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .left,
                                                   accessibilityIdentifier: "OrderProductView.tableNumberLabel")

    private var quantityProductLabel: UILabel = .label(text: "Quantidade",
                                                       font: .systemFont(ofSize: 14, weight: .regular),
                                                       textColor: .init(named: "TitleColor"),
                                                       textAlignment: .right,
                                                       accessibilityIdentifier: "OrderProductView.quantityProductLabel")

    private var tableNumberTextField: UITextField = .textField(keybordType: .numberPad,
                                                               textPlaceHolder: "0",
                                                               colorPlaceHolder: .black,
                                                               textColor: .black,
                                                               font: .systemFont(ofSize: 16, weight: .regular),
                                                               borderColor: UIColor.init(named: "Background2")?.cgColor,
                                                               cornerRadius: 8,
                                                               borderWidth: 1,
                                                               accessibilityIdentifier: "OrderProductView.tableNumberTextField")

    private var quantityProductTextField: UITextField = .textField(keybordType: .numberPad,
                                                                   textPlaceHolder: "0",
                                                                   colorPlaceHolder: .black,
                                                                   textColor: .black,
                                                                   font: .systemFont(ofSize: 16, weight: .regular),
                                                                   borderColor: UIColor.init(named: "Background2")?.cgColor,
                                                                   cornerRadius: 8,
                                                                   borderWidth: 1,
                                                                   accessibilityIdentifier: "OrderProductView.quantityProductTextField")

    private var tableNumberAndQtdProductStackView: UIStackView = .stack(axis: .horizontal,
                                                                        distribution: .fillEqually,
                                                                        alignment: .center,
                                                                        contentMode: .scaleToFill)

    private lazy var totalPriceOrderLabel: UILabel = .label(text: "Total: R$ 0.00",
                                                            font: .systemFont(ofSize: 14, weight: .regular),
                                                            textColor: .init(named: "TitleColor"),
                                                            textAlignment: .right,
                                                            accessibilityIdentifier: "OrderProductView.totalPriceOrderLabel")

    private var confirmOrderButton: UIButton = .button(type: .system,
                                                       title: "Confirmar pedido",
                                                       backgroundColor: UIColor.init(named: "PrimaryColorButton"),
                                                       titleColor: .white,
                                                       titleFont: .systemFont(ofSize: 14, weight: .medium),
                                                       cornerRadius: 12,
                                                       borderWidth: 1,
                                                       borderColor: UIColor.clear.cgColor,
                                                       isEnabled: false,
                                                       alpha: 0.5,
                                                       accessibilityIdentifier: "OrderProductView.confirmOrderButton")

    private var sizeProductButtons = [UIButton]()
    private var product: Product?
    weak var delegate: OrderProductViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        createArrayButtonForSizeProduct()
        configBackgroundLinear()
        callTargetQtdProductTextField()
        configShowKeyboard()
        delegates()
        additionalConfigButtons()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    private func delegates() {
        tableNumberTextField.delegate = self
        quantityProductTextField.delegate = self
    }

    func getProduct(product: Product?) {
        if let product = product {
            let imageUrl = URL(string: product.photo_url)
            productImageView.kf.setImage(with: imageUrl)
            nameProductLabel.text = product.name
            self.product = product
        }
    }
    
    private func configView() {
        addSubviews(headerView,
                    productImageView,
                    nameProductLabel,
                    titleSelectSizeProductLabel,
                    buttonsSizeProductStack,
                    tableNumberLabel,
                    quantityProductLabel,
                    tableNumberAndQtdProductStackView,
                    totalPriceOrderLabel,
                    confirmOrderButton)
        tableNumberAndQtdProductStackView.addArrangedSubview(tableNumberTextField)
        tableNumberAndQtdProductStackView.addArrangedSubview(quantityProductTextField)

        constraints()
    }

    private func createArrayButtonForSizeProduct() {
        let myArraySizeProduct: [String] = ["Pequena", "Média", "Grande"]
        for (index, element) in myArraySizeProduct.enumerated() {
            let sizeProductButton = createPropertiesButtonsSizeProduct(title: element, index: index)
            sizeProductButton.heightAnchor.constraint(equalToConstant: 82).isActive = true
            sizeProductButtons.append(sizeProductButton)
            buttonsSizeProductStack.addArrangedSubview(sizeProductButton)
        }
    }

    private func createPropertiesButtonsSizeProduct(title: String, index: Int) -> UIButton {
        guard let tintImage = UIColor(named: "TitleColor") else { return UIButton() }
        let sizeProductButton: UIButton = .button(type: .system,
                                                title: title,
                                                backgroundColor: .white,
                                                titleColor: .init(named: "TitleColor"),
                                                titleFont: .systemFont(ofSize: 16, weight: .regular),
                                                cornerRadius: 8,
                                                borderWidth: 1,
                                                borderColor: UIColor(named: "Background2")?.cgColor,
                                                accessibilityIdentifier: "OrderProductView.sizeProductButton\(title)")
        sizeProductButton.addTarget(self, action: #selector(selectedSizeProduct), for: .touchDown)
        sizeProductButton.setImage(UIImage(systemName: "circle"), for: .normal)
        sizeProductButton.imageView?.contentMode = .scaleToFill
        sizeProductButton.contentHorizontalAlignment = .left
        sizeProductButton.setImageTintColorButton(tintImage)
        sizeProductButton.alignItensVertical()
        sizeProductButton.tag = index
        return sizeProductButton
    }

    @objc func selectedSizeProduct(sender: UIButton) {
        guard let tintImage = UIColor(named: "TitleColor"),
              let primaryColorButton = UIColor(named: "PrimaryColorButton")
        else { return }
        for button in sizeProductButtons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                button.imageView?.contentMode = .scaleToFill
                button.setImageTintColorButton(primaryColorButton)
                button.layer.borderColor = primaryColorButton.cgColor
                button.backgroundColor = UIColor(named: "SecondaryColorButton")
                button.contentHorizontalAlignment = .left
                button.alignItensVertical()
                quantityProductText = button.currentTitle ?? ""
            } else {
                button.setImage(UIImage(systemName: "circle"), for: .normal)
                button.imageView?.contentMode = .scaleToFill
                button.contentHorizontalAlignment = .left
                button.layer.borderColor =  UIColor.init(named: "Background2")?.cgColor
                button.backgroundColor = .white
                button.setImageTintColorButton(tintImage)
                button.alignItensVertical()
            }
        }
    }

    @objc private func updateTotalOrder() {
        if let product = product, let qtdProduct = quantityProductTextField.text {
            if ((qtdProduct as NSString).doubleValue > 0) {
                switch quantityProductText {
                case "Pequena":
                    totalPriceOrderLabel.text = "R$ \(product.price.small * ((qtdProduct as NSString).doubleValue))"
                case "Média":
                    totalPriceOrderLabel.text = "R$ \(product.price.medium * ((qtdProduct as NSString).doubleValue))"
                case "Grande":
                    totalPriceOrderLabel.text = "R$ \(product.price.big * ((qtdProduct as NSString).doubleValue))"
                default:
                    totalPriceOrderLabel.text = "R$ 0.00"
                }
            }
        }
    }

    private func configShowKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.productImageView.isHidden = true
                self.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }

    private func additionalConfigButtons() {
        confirmOrderButton.addTarget(self, action: #selector(checkout), for: .touchDown)
    }

    @objc private func checkout() {
        guard let qtdText = quantityProductTextField.text,
              let tableNumberText = tableNumberTextField.text,
              let totalPriceLabel = totalPriceOrderLabel.text
        else {
            return
        }
        print("Mesa: \(tableNumberText), Quantidade produto: \(qtdText) e valor do pedido R$ \(totalPriceLabel)");
        delegate?.didCheckout()
    }

    private func callTargetQtdProductTextField() {
        quantityProductTextField.addTarget(self, action: #selector(updateTotalOrder), for: .editingChanged)
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight)
        ])

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 53),
            productImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 240),
            productImageView.heightAnchor.constraint(equalToConstant: 240)
        ])

        NSLayoutConstraint.activate([
            nameProductLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -10),
            nameProductLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            titleSelectSizeProductLabel.topAnchor.constraint(equalTo: nameProductLabel.bottomAnchor, constant: 26),
            titleSelectSizeProductLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            titleSelectSizeProductLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            buttonsSizeProductStack.topAnchor.constraint(equalTo: titleSelectSizeProductLabel.bottomAnchor, constant: 16),
            buttonsSizeProductStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            buttonsSizeProductStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            tableNumberLabel.topAnchor.constraint(equalTo: buttonsSizeProductStack.bottomAnchor, constant: 20),
            tableNumberLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])

        NSLayoutConstraint.activate([
            quantityProductLabel.topAnchor.constraint(equalTo: buttonsSizeProductStack.bottomAnchor, constant: 20),
            quantityProductLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            tableNumberAndQtdProductStackView.topAnchor.constraint(equalTo: quantityProductLabel.bottomAnchor, constant: 8),
            tableNumberAndQtdProductStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            tableNumberAndQtdProductStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),

            tableNumberTextField.heightAnchor.constraint(equalToConstant: 56),
            quantityProductTextField.heightAnchor.constraint(equalToConstant: 56)
        ])

        NSLayoutConstraint.activate([
            totalPriceOrderLabel.bottomAnchor.constraint(equalTo: confirmOrderButton.topAnchor, constant: -12),
            totalPriceOrderLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            confirmOrderButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            confirmOrderButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            confirmOrderButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -9),
            confirmOrderButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func configBackgroundLinear() {
        let bounds = UIScreen.main.bounds
        let boundsStack = CGRect(x: 0, y: 0, width: bounds.size.width, height: headerViewHeight)
        headerView.layer.addSublayer(CAGradientLayer.linearGradient(topColor: UIColor(named: "Red"),
                                                                    bottomColor: UIColor(named: "DarkRed"),
                                                                    bounds: boundsStack))
    }
}

extension OrderProductView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        productImageView.isHidden = false
        self.endEditing(true)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let qtdText = quantityProductTextField.text,
              let tableNumberText = tableNumberTextField.text
        else {
            return
        }
        if !qtdText.isEmpty && !tableNumberText.isEmpty {
            confirmOrderButton.isEnabled = true
            confirmOrderButton.alpha = 1
        } else {
            confirmOrderButton.isEnabled = false
            confirmOrderButton.alpha = 0.5
        }
    }
}
