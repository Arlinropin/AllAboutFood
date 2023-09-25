//
//  LoginViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goHomeView", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goHomeView" {
            let destination = segue.destination as! TabBarHomeController
        }
    }
    

}
