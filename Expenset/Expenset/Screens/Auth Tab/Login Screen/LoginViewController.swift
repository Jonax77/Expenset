//
//  TestViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/19/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let childProgressView = LoadingViewController()
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginView.buttonNext.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
        self.loginView.buttonSignUp.addTarget(self, action: #selector(onSignUpButtonTapped), for: .touchUpInside)
        

       
    }
    
    @objc private func onSignUpButtonTapped() {
        self.navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    @objc private func onSubmitButtonTapped() {
        if let email = loginView.textFieldEmail.text,
           let password = loginView.textFieldPassword.text {
            signInToFirebase(email: email, password: password)
        }
    }
    
    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel)
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true)
    }

}

#Preview {
    LoginViewController()
}
