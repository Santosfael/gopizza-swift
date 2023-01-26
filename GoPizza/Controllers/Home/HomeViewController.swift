//
//  HomeViewController.swift
//  GoPizza
//
//  Created by Rafael Rocha on 18/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var container = HomeView()
    private let searchController = UISearchController(searchResultsController: nil)

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
        title = "Olá, Garçom"
        navigationBarConfig()
        iconButtonNavigationBar()
    }

    private func navigationBarConfig() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        definesPresentationContext = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearenceNavigation()
        navigationController?.navigationBar.compactAppearance = appearenceNavigation()
        navigationController?.navigationBar.scrollEdgeAppearance = appearenceNavigation()
    
        searchBarControllerSetup()
    }

    private func appearenceNavigation() -> UINavigationBarAppearance {
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.backgroundColor = UIColor(named: "DarkRed")
        return appearence
    }

    private func iconButtonNavigationBar() {
        let logoutIconButton = UIBarButtonItem(image: UIImage.init(named: "logout"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutIconButton
    }

    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Pesquisar pizza"
        definesPresentationContext = true
        searchController.loadViewIfNeeded()
        searchController.searchBar.autocapitalizationType = .none

        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.delegate = self
    
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
    }

    @objc private func logout() {
    }
}

extension HomeViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
