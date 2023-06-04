//
//  OrderProductViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 26/01/23.
//

import UIKit

class OrderProductViewController: UIViewController {
    
    private var content: OrderProductView
    private var viewModel: OrderProductViewModelProtocol
    private var coordinator: CoordinatorProtocol

    init(content: OrderProductView = OrderProductView(),
         viewModel: OrderProductViewModelProtocol = OrderProductViewModel(),
         coordinator: CoordinatorProtocol) {
        self.content = content
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = content
        content.delegate = self
        content.getProduct(product: viewModel.getProduct())
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        configNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}

extension OrderProductViewController: OrderProductViewDelegate {
    func didCheckout() {
        coordinator.presentPreviousStep()
    }
}
