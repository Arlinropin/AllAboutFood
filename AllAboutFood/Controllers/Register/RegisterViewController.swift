//
//  RegisterViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import UIKit
import NotificationBannerSwift

class RegisterViewController: UIViewController {

    // MARK: - Oulets
    @IBOutlet weak var viewWithGradient: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods
    private func setupUI() {
        nameTextField.layer.borderColor = UIColor.label.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 5
        surnameTextField.layer.borderColor = UIColor.label.cgColor
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.label.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        newPasswordTextField.layer.borderColor = UIColor.label.cgColor
        newPasswordTextField.layer.borderWidth = 1
        newPasswordTextField.layer.cornerRadius = 5
        confirmPasswordTextField.layer.borderColor = UIColor.label.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.cornerRadius = 5
        signinButton.layer.borderColor = UIColor.label.cgColor
        signinButton.layer.borderWidth = 1
        signinButton.layer.cornerRadius = 5
        
        viewWithGradient.layer.addHorizontalGradient(
            bounds: viewWithGradient.bounds,
            percentage: 0.4,
            topColor: .systemBackground,
            bottomColor: .systemBackground.withAlphaComponent(0.2))
    }

    private func performRegister() {
        guard let name = nameTextField.text, !name.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "Please write your name.",
                style: .warning).show()
            return
        }
        guard let surname = surnameTextField.text, !surname.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "Please write your surname.",
                style: .warning).show()
            return
        }
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "You need a valid email address.",
                style: .warning).show()
            return
        }
        guard let password = newPasswordTextField.text, !password.isEmpty else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "You need a valid password.",
                style: .warning).show()
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty, confirmPassword != password else {
            NotificationBanner(
                title: "I'm sorry",
                subtitle: "Passwords in writing are not the same.",
                style: .warning).show()
            return
        }
        NavigationManager.changeRootViewController(to: TabBarHomeController())
    }

    // MARK: - IBAction
    @IBAction func goToLogin(_ sender: UIButton) {
        view.endEditing(true)
        performRegister()
    }
}
