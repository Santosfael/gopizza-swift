//
//  OrderPizzaView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 26/01/23.
//

import UIKit

final class OrderPizzaView: UIView {

    private let headerViewHeight: CGFloat = 172

    private var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var pizzaImageView: UIImageView = .imageView(image: .init(named: "pizza"),
                                                         contentMode: .scaleToFill,
                                                         accessibilityIdentifier: "OrderPizzaView.pizzaImageView")

    private var namePizzaLabel: UILabel = .label(text: "Margherita",
                                                   font: .systemFont(ofSize: 32, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .center,
                                                   accessibilityIdentifier: "OrderPizzaView.namePizzaLabel")

    private var titleSelectSizePizzaLabel: UILabel = .label(text: "Selecione um tamanho",
                                                            font: .systemFont(ofSize: 14, weight: .regular),
                                                            textColor: .init(named: "TitleColor"),
                                                            textAlignment: .left,
                                                            accessibilityIdentifier: "OrderPizzaView.titleSelectSizePizzaLabel")

    private var buttonsSizePizzaStack: UIStackView = .stack(axis: .horizontal,
                                            distribution: .fillEqually,
                                            alignment: .center,
                                            contentMode: .center)

    private var tableNumberLabel: UILabel = .label(text: "Número da mesa",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .left,
                                                   accessibilityIdentifier: "OrderPizzaView.tableNumberLabel")

    private var quantityPizzaLabel: UILabel = .label(text: "Quantidade",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                     textAlignment: .right,
                                                   accessibilityIdentifier: "OrderPizzaView.quantityPizzaLabel")

    private var tableNumberTextField: UITextField = .textField(keybordType: .numberPad,
                                                               textPlaceHolder: "0",
                                                               colorPlaceHolder: .black,
                                                               textColor: .black,
                                                               font: .systemFont(ofSize: 16, weight: .regular),
                                                               borderColor: UIColor.init(named: "Background2")?.cgColor,
                                                               cornerRadius: 8,
                                                               borderWidth: 1,
                                                               accessibilityIdentifier: "OrderPizzaView.tableNumberTextField")

    private var quantityPizzaTextField: UITextField = .textField(keybordType: .numberPad,
                                                                 textPlaceHolder: "0",
                                                                 colorPlaceHolder: .black,
                                                                 textColor: .black,
                                                                 font: .systemFont(ofSize: 16, weight: .regular),
                                                                 borderColor: UIColor.init(named: "Background2")?.cgColor,
                                                                 cornerRadius: 8,
                                                                 borderWidth: 1,
                                                                 accessibilityIdentifier: "OrderPizzaView.quantityPizzaTextField")

    private var tableNumberAndQtdPizzaStackView: UIStackView = .stack(axis: .horizontal,
                                                                      distribution: .fillEqually,
                                                                      alignment: .center,
                                                                      contentMode: .scaleToFill)

    private var totalPriceOrderLabel: UILabel = .label(text: "Total: R$ 10,00",
                                                         font: .systemFont(ofSize: 14, weight: .regular),
                                                         textColor: .init(named: "TitleColor"),
                                                         textAlignment: .right,
                                                         accessibilityIdentifier: "OrderPizzaView.totalPriceOrderLabel")

    private var confirmOrderButton: UIButton = .button(type: .system,
                                                       title: "Confirmar pedido",
                                                       backgroundColor: UIColor.init(named: "PrimaryColorButton"),
                                                       titleColor: .white,
                                                       titleFont: .systemFont(ofSize: 14, weight: .medium),
                                                       cornerRadius: 12,
                                                       borderWidth: 1, borderColor: UIColor.clear.cgColor,
                                                       accessibilityIdentifier: "OrderPizzaView.confirmOrderButton")

    private var sizePizzaButtons = [UIButton]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        createArrayButtonForSizePizza()
        configBackgroundLinear()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func configView() {
        addSubviews(headerView,
                    pizzaImageView,
                    namePizzaLabel,
                    titleSelectSizePizzaLabel,
                    buttonsSizePizzaStack,
                    tableNumberLabel,
                    quantityPizzaLabel,
                    tableNumberAndQtdPizzaStackView,
                    totalPriceOrderLabel,
                    confirmOrderButton)
        tableNumberAndQtdPizzaStackView.addArrangedSubview(tableNumberTextField)
        tableNumberAndQtdPizzaStackView.addArrangedSubview(quantityPizzaTextField)

        constraints()
    }

    private func createArrayButtonForSizePizza() {
        let myArraySizePizza: [String] = ["Pequena", "Média", "Grande"]
        for (index, element) in myArraySizePizza.enumerated() {
            let sizePizzaButton = createPropertiesButtonsSizePizza(title: element, index: index)
            sizePizzaButton.heightAnchor.constraint(equalToConstant: 82).isActive = true
            sizePizzaButtons.append(sizePizzaButton)
            buttonsSizePizzaStack.addArrangedSubview(sizePizzaButton)
        }
    }

    private func createPropertiesButtonsSizePizza(title: String, index: Int) -> UIButton {
        guard let tintImage = UIColor(named: "TitleColor") else { return UIButton() }
        let sizePizzaButton: UIButton = .button(type: .system,
                                                title: title,
                                                backgroundColor: .white,
                                                titleColor: .init(named: "TitleColor"),
                                                titleFont: .systemFont(ofSize: 16, weight: .regular),
                                                cornerRadius: 8,
                                                borderWidth: 1,
                                                borderColor: UIColor(named: "Background2")?.cgColor,
                                                accessibilityIdentifier: "OrderPizzaView.sizePizzaButton\(title)")
        sizePizzaButton.addTarget(self, action: #selector(selectedSizePizza), for: .touchDown)
        sizePizzaButton.setImage(UIImage(systemName: "circle"), for: .normal)
        sizePizzaButton.imageView?.contentMode = .scaleToFill
        sizePizzaButton.contentHorizontalAlignment = .left
        sizePizzaButton.setImageTintColorButton(tintImage)
        sizePizzaButton.alignItensVertical()
        sizePizzaButton.tag = index
        return sizePizzaButton
    }

    @objc func selectedSizePizza(sender: UIButton) {
        guard let tintImage = UIColor(named: "TitleColor"),
              let primaryColorButton = UIColor(named: "PrimaryColorButton")
        else { return }
        for button in sizePizzaButtons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                button.imageView?.contentMode = .scaleToFill
                button.setImageTintColorButton(primaryColorButton)
                button.layer.borderColor = primaryColorButton.cgColor
                button.backgroundColor = UIColor(named: "SecondaryColorButton")
                button.contentHorizontalAlignment = .left
                button.alignItensVertical()
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

    private func constraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight)
        ])

        NSLayoutConstraint.activate([
            pizzaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 53),
            pizzaImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 10),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 240),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 240)
        ])

        NSLayoutConstraint.activate([
            namePizzaLabel.topAnchor.constraint(equalTo: pizzaImageView.bottomAnchor, constant: -10),
            namePizzaLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            titleSelectSizePizzaLabel.topAnchor.constraint(equalTo: namePizzaLabel.bottomAnchor, constant: 26),
            titleSelectSizePizzaLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            titleSelectSizePizzaLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            buttonsSizePizzaStack.topAnchor.constraint(equalTo: titleSelectSizePizzaLabel.bottomAnchor, constant: 16),
            buttonsSizePizzaStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            buttonsSizePizzaStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            tableNumberLabel.topAnchor.constraint(equalTo: buttonsSizePizzaStack.bottomAnchor, constant: 20),
            tableNumberLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])

        NSLayoutConstraint.activate([
            quantityPizzaLabel.topAnchor.constraint(equalTo: buttonsSizePizzaStack.bottomAnchor, constant: 20),
            quantityPizzaLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            tableNumberAndQtdPizzaStackView.topAnchor.constraint(equalTo: quantityPizzaLabel.bottomAnchor, constant: 8),
            tableNumberAndQtdPizzaStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            tableNumberAndQtdPizzaStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),

            tableNumberTextField.heightAnchor.constraint(equalToConstant: 56),
            quantityPizzaTextField.heightAnchor.constraint(equalToConstant: 56)
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
