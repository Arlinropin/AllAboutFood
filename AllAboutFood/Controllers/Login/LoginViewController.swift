//
//  LoginViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import UIKit
import NotificationBannerSwift

class LoginViewController: UIViewController {

    // MARK: - Oulets
    @IBOutlet weak var viewWithGradient: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods
    private func setupUI() {
        emailTextField.layer.borderColor = UIColor.label.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.label.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.borderColor = UIColor.label.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 5
        
        viewWithGradient.layer.addHorizontalGradient(
            bounds: viewWithGradient.bounds,
            percentage: 0.4,
            topColor: .systemBackground,
            bottomColor: .systemBackground.withAlphaComponent(0.2))
    }
    
    private func performLogin() {
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "You need a valid email address.",
                style: .warning).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "You need a valid password.",
                style: .warning).show()
            return
        }
        NavigationManager.changeRootViewController(to: TabBarHomeController())
    }

    // MARK: - IBActions
    @IBAction func goToHome(_ sender: UIButton) {
        view.endEditing(true)
        performLogin()
    }
}
