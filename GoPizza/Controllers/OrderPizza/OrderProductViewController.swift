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

    init(content: OrderProductView = OrderProductView(),
         viewModel: OrderProductViewModelProtocol = OrderProductViewModel()) {
        self.content = content
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = content
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

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
