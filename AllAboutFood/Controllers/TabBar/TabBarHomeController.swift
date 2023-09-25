//
//  TabBarHomeController.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import Foundation
import UIKit

class TabBarHomeController: UITabBarController {
    private var searchViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setColorsOfTabBar()
        setViewControllers()
    }
    private func setColorsOfTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .white
    }
    
    func setViewControllers() {
        let newViewControllers = [
            createNavController(for: HomeViewController(),
                                title: "Home",
                                image: UIImage(named: "finder_icon") ?? UIImage()),
            createNavController(for: FinderViewController(),
                                title: "Finder",
                                image: UIImage(named: "finder_icon") ?? UIImage()),
            createNavController(for: ProfileViewController(),
                                title: "Profile",
                                image: UIImage(named: "finder_icon") ?? UIImage()),
            createNavController(for: ConfigurationViewController(),
                                title: "Cofiguration",
                                image: UIImage(named: "finder_icon") ?? UIImage())
        ]
        for (index, item) in newViewControllers.enumerated() {
            item.tabBarItem.tag = index
        }
        setViewControllers(newViewControllers, animated: false)
    }

    private func createNavController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        configure(viewController: navController)
        return navController
    }
    
    func configure(viewController: UIViewController) {
        if let tabBarController = viewController as? UITabBarController {
            tabBarController.viewControllers?.forEach(configure(viewController:))
        }
        if let navigationController = viewController as? UINavigationController,
           let rootViewController = navigationController.viewControllers.first {
            configure(viewController: rootViewController)
        }
    }
}
