//
//  TabBar.swift
//  papcorn101
//
//  Created by Ismail Tever on 22.08.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    // MARK: - Tab setup
    private func setupTabs() {
        
        let home = self.createNav(title: "Movies", image: UIImage(systemName: "house"), vc: HomeViewController())
        let search = self.createNav(title: "Discover", image: UIImage(systemName: "magnifyingglass.circle"), vc: SearchViewController())

        
        self.setViewControllers([home, search], animated: true)
    }
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.topItem?.largeTitleDisplayMode = .always
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
}
