//
//  LoginViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 06/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configBackgroundLinear()
    }
    

    private func configNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func configBackgroundLinear() {
        guard let topColor = UIColor(named: "Red"),
              let bottomColor = UIColor(named: "DarkRed")
        else { return }
        view.layer.addSublayer(CAGradientLayer.grandentLinear(topColor: topColor,
                                                              bottomColor: bottomColor,
                                                              view: self.view))
    }
}
