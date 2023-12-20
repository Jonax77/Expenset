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
        
    }
    

}

#Preview {
    LoginViewController()
}
