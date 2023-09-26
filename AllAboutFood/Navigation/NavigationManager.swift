//
//  NavigationManager.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import UIKit

final class NavigationManager {
    static func changeRootViewController(to newRootViewController: UIViewController) {
        UIApplication.setRootView(newRootViewController)
    }
}
