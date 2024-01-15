//
//  SignupValidateManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/22/23.
//

import Foundation
import UIKit

extension SignupViewController {
    func validateInput() {
        // First, validate all the input fields are not empty.
        guard let name = signupView.textFieldName.text, !name.isEmpty,
              let email = signupView.textFieldEmail.text, !email.isEmpty,
              let password = signupView.textFieldPassword.text, !password.isEmpty else {
            presentAlertWithTitle("Input Error", message: "Please fill in all fields.")
            return
        }
        
        if !isValidEmail(email) {
            presentAlertWithTitle("Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        let repeatPassword = signupView.textFieldRepeatPassword.text
        
        if password != repeatPassword {
            presentAlertWithTitle("Password not the same", message: "Please check your password again.")
            return
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
