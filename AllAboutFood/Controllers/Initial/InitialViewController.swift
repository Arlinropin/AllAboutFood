//
//  InitialViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        signinButton.layer.cornerRadius = signinButton.frame.height / 2
        signinButton.layer.borderColor = UIColor.label.cgColor
        signinButton.layer.borderWidth = 1
    }
    
    @IBAction func goToLogin(_ sender: UIButton) {
        show(LoginViewController(), sender: self)
    }
    @IBAction func goToRegister(_ sender: UIButton) {
        show(RegisterViewController(), sender: self)
    }
}
