//
//  ProductTableViewCell.swift
//  GoPizza
//
//  Created by Rafael Rocha on 23/01/23.
//

import UIKit
import Kingfisher

final class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"

    private lazy var productImage: UIImageView = .imageView(image: UIImage(named: "pizza"),
                                                            contentMode: .scaleAspectFill,
                                                            tintColor: .black,
                                                            accessibilityIdentifier: "ProductTableViewCell.productImage")

    private lazy var productNameLabel: UILabel = .label(text: "Margherita",
                                                        font: UIFont.systemFont(ofSize: 20, weight: .regular),
                                                        textColor: UIColor(named: "TitleColor"),
                                                        numberOflines: 2,
                                                        textAlignment: .left,
                                                        accessibilityIdentifier: "ProductTableViewCell.productNameLabel")

    private lazy var productDescriptionLabel: UILabel = .label(text: "Mussarela, manjericão Fresco, parmesão e tomate",
                                                               font: .systemFont(ofSize: 12, weight: .regular),
                                                               textColor: .init(named: "DescriptionColor"),
                                                               numberOflines: 3,
                                                               textAlignment: .left,
                                                               accessibilityIdentifier: "ProductTableViewCell.productDescriptionLabel")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func setupView() {
        addSubviews(productImage, productNameLabel, productDescriptionLabel)
        constraints()
    }

    func updateProduct(product: Product) {
        let imageUrl = URL(string: product.photo_url)
        productImage.kf.setImage(with: imageUrl)
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            productImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            productImage.widthAnchor.constraint(equalToConstant: 104),
            productImage.heightAnchor.constraint(equalToConstant: 104)
        ])

        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])
    }
}
