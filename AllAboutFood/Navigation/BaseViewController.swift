//
//  BaseViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 28-09-23.
//

import UIKit

class BaseViewController: UIViewController {
    let loader = Loader()
    var manager: PlatziApiManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = .init(network: AppDelegate.network)
    }
    
}
