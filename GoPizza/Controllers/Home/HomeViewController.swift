//
//  HomeViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var container = HomeView()

    init(container: HomeView = HomeView()) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        super.loadView()
        view = container
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        navigationBarConfig()
        configButtonLogout()
    }

    private func navigationBarConfig() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
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
    }
}

extension HomeViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
