//
//  OrderProductCollectionViewCell.swift
//  GoPizza
//
//  Created by Rafael Rocha on 09/02/23.
//

import UIKit

final class OrderProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "OrderProductCollectionViewCell"

    private var productImage: UIImageView = .imageView(image: .init(named: "pizza"),
                                                       contentMode: .scaleToFill,
                                                       accessibilityIdentifier: "OrderProductCollectionViewCell.productImage")

    private var nameProdcutLabel: UILabel = .label(text: "Margherita",
                                                   font: .systemFont(ofSize: 20, weight: .medium),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .center,
                                                   accessibilityIdentifier: "OrderProductCollectionViewCell.nameProductLabel")

    private var tableNumberAndQtdProductLabel: UILabel = .label(text: "Mesa 01 * Qnt: 1",
                                                                font: .systemFont(ofSize: 14, weight: .regular),
                                                                textColor: .init(named: "TitleColor"),
                                                                textAlignment: .center,
                                                                accessibilityIdentifier: "OrderProductCollectionViewCell.tableNumberAndQtdProductLabel")

    private var stateOrderLabel: UILabel = .label(text: "Pronto",
                                                  font: .systemFont(ofSize: 12, weight: .medium),
                                                  textColor: .white,
                                                  textAlignment: .center,
                                                  accessibilityIdentifier: "OrderProductCollectionViewCell.stateOrderLabel")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupView() {
        addSubviews(productImage,
                    nameProdcutLabel,
                    tableNumberAndQtdProductLabel,
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
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 104),
            productImage.heightAnchor.constraint(equalToConstant: 104)
        ])

        NSLayoutConstraint.activate([
            nameProdcutLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
            nameProdcutLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            tableNumberAndQtdProductLabel.topAnchor.constraint(equalTo: nameProdcutLabel.bottomAnchor, constant: 8),
            tableNumberAndQtdProductLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            stateOrderLabel.topAnchor.constraint(equalTo: tableNumberAndQtdProductLabel.bottomAnchor, constant: 16),
            stateOrderLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateOrderLabel.widthAnchor.constraint(equalToConstant: stateOrderLabel.intrinsicContentSize.width + 16),
            stateOrderLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
}
