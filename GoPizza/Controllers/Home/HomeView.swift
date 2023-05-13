//
//  HomeView.swift
//  GoPizza
//
//  Created by Rafael Rocha on 23/01/23.
//

import UIKit

final class HomeView: UIView {
    private let headerViewHeight: CGFloat = 149

    weak var delegate: HomeViewDelegate?

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
                                                    borderWidth: 1,
                                                    accessibilityIdentifier: "HomeView.searchBar")

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

    private var amountProductLabel: UILabel = .label(text: "32 Pizzas",
                                                   font: .systemFont(ofSize: 14, weight: .regular),
                                                   textColor: .init(named: "TitleColor"),
                                                   textAlignment: .right,
                                                   accessibilityIdentifier: "HomeView.amountProductLabel")

    private var menuAndAmountProducStackView: UIStackView = .stack(axis: .horizontal,
                                                                  spacing: 0,
                                                                  distribution: .fill,
                                                                  alignment: .center,
                                                                  contentMode: .scaleToFill,
                                                                  isHidden: true,
                                                                  accessibilityIdentifier: "HomeView.menuAndAmountProducStackView")

    private var productTableView: UITableView = .uiTableView(backgroundColor: .clear,
                                                            isHidden: true,
                                                            accessibilityIdentifier: "HomeView.productTableView")

    private var activityIndicator: UIActivityIndicatorView = .activityIndicator(style: .large,
                                                                                hidesWhenStopped: true,
                                                                                isHidden: false,
                                                                                backgroundColor: .clear,
                                                                                clipsToBounds: true,
                                                                                color: .init(named: "DarkRed"),
                                                                                accessibilityIdentifier: "HomeView.activityIndicator")
    private lazy var products = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configTableViewCell()
        configBackgroundLinear()
        activityIndicator.startAnimating()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func isVisibilityComponents() {
        productTableView.isHidden = false
        menuAndAmountProducStackView.isHidden = false
    }

    private func configTableViewCell() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
    }

    func getProducts() {
        delegate?.listTableProducts(completion: { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }

            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.isVisibilityComponents()
            }
        })
    }

    private func configView() {
        searchBarAndSearchButtonStackView.addArrangedSubview(searchBar)
        searchBarAndSearchButtonStackView.addArrangedSubview(searchButton)
        menuAndAmountProducStackView.addArrangedSubview(titleMenuLabel)
        menuAndAmountProducStackView.addArrangedSubview(amountProductLabel)
        addSubviews(headerView,
                    titleWelcomeLabel,
                    searchBarAndSearchButtonStackView,
                    menuAndAmountProducStackView,
                    productTableView,
                    activityIndicator)
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
            menuAndAmountProducStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            menuAndAmountProducStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 27),
            menuAndAmountProducStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: menuAndAmountProducStackView.bottomAnchor, constant: 20),
            productTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 40)
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
        amountProductLabel.text = "\(products.count) Pizza(s)"
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        let product = products[indexPath.row]
        cell.updateProduct(product: product)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapSelectedPizza()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}
