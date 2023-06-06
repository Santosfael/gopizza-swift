//
//  OrdersProductViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 08/02/23.
//

import UIKit

final class OrdersProductViewController: UIViewController {

    private var container: OrdersProductView
    private var coordinator: CoordinatorProtocol

    init(container: OrdersProductView = OrdersProductView(),
         coordinator: CoordinatorProtocol) {
        self.container = container
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        view = container
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
