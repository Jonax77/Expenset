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

        setupTitle()

        loginView.buttonNext.addTarget(self, action: #selector(clickButtonNext), for: .touchUpInside)
        loginView.buttonSignUp.addTarget(self, action: #selector(clickButtonSignUp), for: .touchUpInside)
    }
    
    private func setupTitle() {
        let title = "Log in"
        let attributedString = NSMutableAttributedString(string: title)
        
        // Apply attributes to the attributed string
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label, // Change text color
            .font: UIFont(name: Comfortaa.Bold, size: 16)// Change font and size
            // Add more attributes if needed
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: title.count))
        
        // Create a label with the attributed string
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedString
        titleLabel.sizeToFit() // Adjust the label size to fit the attributed text
        
        // Set the label as the title view of the navigation item
        navigationItem.titleView = titleLabel
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
