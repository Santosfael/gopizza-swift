//
//  OrdersPizzaView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 08/02/23.
//

import UIKit

final class OrdersPizzaView: UIView {
    private let headerViewHeight: CGFloat = 100

    private var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: UILabel = .label(text: "Pedidos Feitos",
                                             font: .systemFont(ofSize: 24, weight: .medium),
                                             textColor: .white,
                                             textAlignment: .center,
                                             accessibilityIdentifier: "OrdersPizzaView.titleLabel")

    private lazy var ordersPizzaCollectionView: UICollectionView = {
        let layout = layoutCollection()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configBackgroundLinear()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    private func setupView() {
        backgroundColor = UIColor(named: "Background")
        addSubviews(headerView,
                    titleLabel,
                    ordersPizzaCollectionView)
        configCollectionView()
        constraints()
    }

    private func configCollectionView() {
        ordersPizzaCollectionView.delegate = self
        ordersPizzaCollectionView.dataSource = self
        ordersPizzaCollectionView.register(OrderProductCollectionViewCell.self, forCellWithReuseIdentifier: OrderProductCollectionViewCell.identifier)
    }

    private func layoutCollection() -> UICollectionViewFlowLayout {
        let bounds = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (bounds.size.width / 2) - 25, height: 220)
        layout.scrollDirection = .vertical
        return layout
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 56),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            ordersPizzaCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 4),
            ordersPizzaCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ordersPizzaCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ordersPizzaCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
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

extension OrdersPizzaView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderProductCollectionViewCell.identifier, for: indexPath) as? OrderProductCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
