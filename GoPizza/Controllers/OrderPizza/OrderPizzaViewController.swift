//
//  OrderPizzaViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 26/01/23.
//

import UIKit

class OrderPizzaViewController: UIViewController {
    
    private var content: OrderPizzaView

    init(content: OrderPizzaView = OrderPizzaView()) {
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
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
