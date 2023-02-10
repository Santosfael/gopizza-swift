//
//  OrderPizzaCollectionViewCell.swift
//  GoPizza
//
//  Created by Rafael Rocha on 09/02/23.
//

import UIKit

final class OrderPizzaCollectionViewCell: UICollectionViewCell {
    static let identifier = "OrderPizzaCollectionViewCell"

    private var pizzaImage: UIImageView = .imageView(image: .init(named: "pizza"),
                                                     contentMode: .scaleToFill,
                                                     accessibilityIdentifier: "OrderPizzaCollectionViewCell.pizzaImage")

    private var namePizzaLabel: UILabel = .label(text: "Margherita",
                                                 font: .systemFont(ofSize: 20, weight: .medium),
                                                 textColor: .init(named: "TitleColor"),
                                                 textAlignment: .center,
                                                 accessibilityIdentifier: "OrderPizzaCollectionViewCell.namePizzaLabel")

    private var tableNumberAndQtdPizzaLabel: UILabel = .label(text: "Mesa 01 * Qnt: 1",
                                                              font: .systemFont(ofSize: 14, weight: .regular),
                                                              textColor: .init(named: "TitleColor"),
                                                              textAlignment: .center,
                                                              accessibilityIdentifier: "OrderPizzaCollectionViewCell.tableNumberAndQtdPizzaLabel")

    private var stateOrderLabel: UILabel = .label(text: "Pronto",
                                                  font: .systemFont(ofSize: 12, weight: .medium),
                                                  textColor: .white,
                                                  textAlignment: .center,
                                                  accessibilityIdentifier: "OrderPizzaCollectionViewCell.stateOrderLabel")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupView() {
        addSubviews(pizzaImage,
                    namePizzaLabel,
                    tableNumberAndQtdPizzaLabel,
                    stateOrderLabel)

        constraints()
        configBackgroundStateOrderLabel()
    }

    private func configBackgroundStateOrderLabel() {
        stateOrderLabel.backgroundColor = UIColor(named: "PrimaryColorButton")
        stateOrderLabel.layer.cornerRadius = 10
        stateOrderLabel.clipsToBounds = true
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            pizzaImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            pizzaImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pizzaImage.widthAnchor.constraint(equalToConstant: 104),
            pizzaImage.heightAnchor.constraint(equalToConstant: 104)
        ])

        NSLayoutConstraint.activate([
            namePizzaLabel.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 5),
            namePizzaLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            tableNumberAndQtdPizzaLabel.topAnchor.constraint(equalTo: namePizzaLabel.bottomAnchor, constant: 8),
            tableNumberAndQtdPizzaLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            stateOrderLabel.topAnchor.constraint(equalTo: tableNumberAndQtdPizzaLabel.bottomAnchor, constant: 16),
            stateOrderLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateOrderLabel.widthAnchor.constraint(equalToConstant: stateOrderLabel.intrinsicContentSize.width + 16),
            stateOrderLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
}
