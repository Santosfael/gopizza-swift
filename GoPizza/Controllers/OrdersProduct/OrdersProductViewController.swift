//
//  OrdersProductViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 08/02/23.
//

import UIKit

final class OrdersProductViewController: UIViewController {

    private var container = OrdersProductView()

    init(container: OrdersProductView = OrdersProductView()) {
        self.container = container
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
        navigationController?.isNavigationBarHidden = true
    }
}
