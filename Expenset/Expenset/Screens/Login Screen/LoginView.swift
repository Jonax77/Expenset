//
//  LoginView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class LoginView: UIView {
    
    var titleLabel: UILabel!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var buttonNext: UIButton!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        setupView()
        setupConstraint()
    }
    
    func setupView() {
        setupTitleLabel()
        setupLabelEmail()
        setupTextFieldEmail()
        setupLabelPassword()
        setupTextFieldPassword()
        setupButtonNext()
        setupButtonSignUp()
    }

    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Log in"
        titleLabel.textColor = UIColor.label
        titleLabel.font =  UIFont(name: Comfortaa.Bold, size: 32)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.textColor = UIColor.label
        labelEmail.font =  UIFont(name: Comfortaa.Bold, size: 18)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }

    func setupLabelPassword() {
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.textColor = UIColor.label
        labelPassword.font = UIFont(name: Comfortaa.Bold, size: 18)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
    }

    func setupTextFieldEmail(){
        textFieldEmail = InputField()
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = InputField()
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupButtonNext(){
        buttonNext = SubmitButton()
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonNext)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton()
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.titleLabel?.textColor = UIColor.label
        buttonSignUp.titleLabel?.font = UIFont(name: Comfortaa.Regular, size: 16)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 40),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 32),
            labelPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 40),
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            buttonSignUp.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            
            buttonNext.topAnchor.constraint(equalTo: buttonSignUp.bottomAnchor, constant: 16),
            buttonNext.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            buttonNext.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonNext.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
