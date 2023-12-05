//
//  LoginViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let childProgressView = LoginViewController()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Sign up"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = .white
        
        loginView.buttonNext.addTarget(self, action: #selector(clickButtonNext), for: .touchUpInside)
        loginView.buttonSignUp.addTarget(self, action: #selector(clickButtonSignUp), for: .touchUpInside)
    }
    
    @objc func clickButtonNext() {
        if let email = loginView.textFieldEmail.text,
           let password = loginView.textFieldPassword.text {
            signInToFirebase(email: email, password: password)
        }
        
    }

    @objc func clickButtonSignUp() {
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel)
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true)
    }

}
