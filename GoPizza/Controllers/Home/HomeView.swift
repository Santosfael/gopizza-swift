//
//  HomeView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 23/01/23.
//

import UIKit

final class HomeView: UIView {

    private var titleMenuLabel: UILabel = .label(text: "Cardápio",
                                            font: .systemFont(ofSize: 20, weight: .regular),
                                            textColor: .init(named: "TitleColor"),
                                            textAlignment: .left,
                                            accessibilityIdentifier: "HomeView.titleMenuLabel")

    private var amountPizzaLabel: UILabel = .label(text: "32 Pizzas",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   accessibilityIdentifier: "HomeView.amountPizzaLabel")

    private var menuAndAmountPizzaStackView: UIStackView = .stack(axis: .horizontal,
                                                                  spacing: 0,
                                                                  distribution: .fill,
                                                                  alignment: .center,
                                                                  contentMode: .scaleToFill,
                                                                  accessibilityIdentifier: "HomeView.menuAndAmountPizzaStackView")

    private var pizzasTableView: UITableView = .uiTableView(backgroundColor: .clear,
                                                            accessibilityIdentifier: "HomeView.pizzasTableView")

    override init(frame: CGRect) {
        super.init(frame: frame)
        pizzasTableView.delegate = self
        pizzasTableView.dataSource = self
        pizzasTableView.register(PizzasTableViewCell.self, forCellReuseIdentifier: PizzasTableViewCell.identifier)
        configView()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func configView() {
        menuAndAmountPizzaStackView.addArrangedSubview(titleMenuLabel)
        menuAndAmountPizzaStackView.addArrangedSubview(amountPizzaLabel)
        addSubviews(menuAndAmountPizzaStackView, pizzasTableView)
        constraints()
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            menuAndAmountPizzaStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            menuAndAmountPizzaStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            menuAndAmountPizzaStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            pizzasTableView.topAnchor.constraint(equalTo: menuAndAmountPizzaStackView.bottomAnchor, constant: 20),
            pizzasTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pizzasTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            pizzasTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PizzasTableViewCell.identifier, for: indexPath) as? PizzasTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        return cell
    }
}
