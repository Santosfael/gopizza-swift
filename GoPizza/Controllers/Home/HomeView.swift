//
//  HomeView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 23/01/23.
//

import UIKit

final class HomeView: UIView {
    private let headerViewHeight: CGFloat = 149

    private var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleWelcomeLabel: UILabel = .label(text: "Olá, Garçom",
                                                    font: .systemFont(ofSize: 26, weight: .medium),
                                                    textColor: .white,
                                                    accessibilityIdentifier: "HomeView.titleWelcomeLabel")

    private var searchBar: UISearchBar = .searchBar(placeholder: "Pesquisar pizza",
                                                     autocapitalizationType: .none,
                                                     searchTextFieldBackgroundColor: .white,
                                                     borderColor: UIColor(named: "TernaryBackground"),
                                                     cornerRadius: 16,
                                                     clipsToBounds: true,
                                                     borderWidth: 1)

    private var searchButton: UIButton = .button(type: .system,
                                                 backgroundColor: .init(named: "PrimaryColorButton"),
                                                 cornerRadius: 12,
                                                 borderWidth: 0,
                                                 accessibilityIdentifier: "HomeView.searchButton",
                                                 image: UIImage(systemName: "magnifyingglass"),
                                                 imageColor: .white)

    private var searchBarAndSearchButtonStackView: UIStackView = .stack(axis: .horizontal,
                                                                        spacing: 7,
                                                                        distribution: .fill,
                                                                        alignment: .center,
                                                                        contentMode: .scaleToFill,
                                                                        accessibilityIdentifier: "HomeView.searchBarAndSearchButtonStackView")

    private var titleMenuLabel: UILabel = .label(text: "Cardápio",
                                            font: .systemFont(ofSize: 20, weight: .regular),
                                            textColor: .init(named: "TitleColor"),
                                            textAlignment: .left,
                                            accessibilityIdentifier: "HomeView.titleMenuLabel")

    private var amountPizzaLabel: UILabel = .label(text: "32 Pizzas",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .right,
                                                   accessibilityIdentifier: "HomeView.amountPizzaLabel")

    private var menuAndAmountPizzaStackView: UIStackView = .stack(axis: .horizontal,
                                                                  spacing: 0,
                                                                  distribution: .fill,
                                                                  alignment: .center,
                                                                  contentMode: .scaleToFill,
                                                                  accessibilityIdentifier: "HomeView.menuAndAmountPizzaStackView")

    private var pizzasTableView: UITableView = .uiTableView(backgroundColor: .clear,
                                                            accessibilityIdentifier: "HomeView.pizzasTableView")

    weak var delegate: HomeViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configTableViewCell()
        configBackgroundLinear()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func configTableViewCell() {
        pizzasTableView.delegate = self
        pizzasTableView.dataSource = self
        pizzasTableView.register(PizzasTableViewCell.self, forCellReuseIdentifier: PizzasTableViewCell.identifier)
    }

    private func configView() {
        searchBarAndSearchButtonStackView.addArrangedSubview(searchBar)
        searchBarAndSearchButtonStackView.addArrangedSubview(searchButton)
        menuAndAmountPizzaStackView.addArrangedSubview(titleMenuLabel)
        menuAndAmountPizzaStackView.addArrangedSubview(amountPizzaLabel)
        addSubviews(headerView,
                    titleWelcomeLabel,
                    searchBarAndSearchButtonStackView,
                    menuAndAmountPizzaStackView,
                    pizzasTableView)
        constraints()
    }

    private func constraints() {

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight)
        ])

        NSLayoutConstraint.activate([
            titleWelcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleWelcomeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            searchBarAndSearchButtonStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -23),
            searchBarAndSearchButtonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            searchBarAndSearchButtonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),

            searchBar.heightAnchor.constraint(equalToConstant: 48),
            searchButton.heightAnchor.constraint(equalToConstant: 48),
            searchButton.widthAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            menuAndAmountPizzaStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
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

    private func configBackgroundLinear() {
        let bounds = UIScreen.main.bounds
        let boundsStack = CGRect(x: 0, y: 0, width: bounds.size.width, height: headerViewHeight)
        headerView.layer.addSublayer(CAGradientLayer.linearGradient(topColor: UIColor(named: "Red"),
                                                                    bottomColor: UIColor(named: "DarkRed"),
                                                                    bounds: boundsStack))
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapSelectedPizza()
    }
}
