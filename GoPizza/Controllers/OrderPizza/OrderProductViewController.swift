//
//  OrderProductViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 26/01/23.
//

import UIKit

class OrderProductViewController: UIViewController {
    
    private var content: OrderProductView

    init(content: OrderProductView = OrderProductView()) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = content
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        configNavigationBar()
        // Do any additional setup after loading the view.
    }

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
