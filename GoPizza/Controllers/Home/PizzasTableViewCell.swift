//
//  PizzasTableViewCell.swift
//  GoPizza
//
//  Created by Rafael Rocha on 23/01/23.
//

import UIKit

final class PizzasTableViewCell: UITableViewCell {
    static let identifier = "PizzasTableViewCell"

    private lazy var pizzaImage: UIImageView = .imageView(image: UIImage(named: "pizza"),
                                                          contentMode: .center,
                                                          tintColor: .black,
                                                          accessibilityIdentifier: "PizzaTableViewCell.pizzaImage")

    private lazy var pizzaNameLabel: UILabel = .label(text: "Margherita",
                                                 font: UIFont.systemFont(ofSize: 20, weight: .regular),
                                                 textColor: UIColor(named: "TitleColor"),
                                                 textAlignment: .left,
                                                 accessibilityIdentifier: "PizzaTableViewCell.pizzaNameLabel")

    private lazy var pizzaDescriptionLabel: UILabel = .label(text: "Mussarela, manjericão Fresco, parmesão e tomate",
                                                             font: .systemFont(ofSize: 12, weight: .regular),
                                                             textColor: .init(named: "DescriptionColor"),
                                                             numberOflines: 3,
                                                             textAlignment: .left,
                                                             accessibilityIdentifier: "PizzasTableViewCell.pizzaDescriptionLabel")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func setupView() {
        addSubviews(pizzaImage, pizzaNameLabel, pizzaDescriptionLabel)
        constraints()
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            pizzaImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            pizzaImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            pizzaImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12),
            pizzaImage.widthAnchor.constraint(equalToConstant: 104)
        ])
        
        NSLayoutConstraint.activate([
            pizzaNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 38),
            pizzaNameLabel.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            pizzaDescriptionLabel.topAnchor.constraint(equalTo: pizzaNameLabel.bottomAnchor, constant: 8),
            pizzaDescriptionLabel.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 20),
            pizzaDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }
}
