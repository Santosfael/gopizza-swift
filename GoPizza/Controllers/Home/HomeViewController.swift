//
//  HomeViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var container: HomeView
    private var coordinator: CoordinatorProtocol
    private let viewModel: HomeViewModelProtocol

    init(container: HomeView = HomeView(),
         coordinator: CoordinatorProtocol,
         viewModel: HomeViewModelProtocol = HomeViewModel(productService: ProductService())) {
        self.container = container
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        super.loadView()
        container.delegate = self
        container.getProducts()
        view = container
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        navigationBarConfig()
        configButtonLogout()
    }

    private func navigationBarConfig() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    private func configButtonLogout() {
        let logoutIconButton = UIBarButtonItem(image: UIImage.init(named: "logout"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(logout))
        logoutIconButton.tintColor = .white
        navigationItem.rightBarButtonItem = logoutIconButton
    }

    @objc private func logout() {
        coordinator.presentPreviousStep()
    }
}

extension HomeViewController: HomeViewDelegate {
    func listTableProducts(completion: @escaping (Result<[Product], ResponseError>) -> Void) {
        viewModel.listAllProducts(productName: nil, completion: completion)
    }

    func didTapSelectedPizza() {
        coordinator.presentNextStep()
    }
}
