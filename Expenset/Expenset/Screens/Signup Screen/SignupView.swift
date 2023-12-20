//
//  SignupView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit


class SignupView: UIView {
    
    var titleLabel: UILabel!
    var labelName: UILabel!
    var textFieldName: UITextField!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var labelRepeatPassword: UILabel!
    var textFieldRepeatPassword: UITextField!
    var buttonNext: UIButton!
    var takePhotoLabel: UILabel!
    var buttonTakePhoto: UIButton!
    
    var wrapperView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    func setupView(){
        setupWrapperView()
        setupTitleLabel()
        setupLabelName()
        setupTextFieldName()
        setupLabelEmail()
        setupTextFieldEmail()
        setupPasswordLabel()
        setupTextFieldPassword()
        setupButtonNext()
        setupLabelRepeatPassword()
        setupTextFieldRepeatPassword()
        setupTakePhotoLabel()
        setupbuttonTakePhoto()
    }
    
    func setupWrapperView() {
        wrapperView = UIScrollView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperView)
    }
    
    func setupTakePhotoLabel() {
        takePhotoLabel = UILabel()
        takePhotoLabel.text = "Add a profile photo (Optional)"
        takePhotoLabel.textColor = UIColor.label
        takePhotoLabel.font =  UIFont(name: Comfortaa.Bold, size: 18)
        takePhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(takePhotoLabel)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton()
        buttonTakePhoto.setImage(UIImage(systemName: "photo.on.rectangle.angled")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(buttonTakePhoto)
        }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Sign up"
        titleLabel.textColor = UIColor.label
        titleLabel.font =  UIFont(name: Comfortaa.Bold, size: 32)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(titleLabel)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Name"
        labelName.textColor = UIColor.label
        labelName.font =  UIFont(name: Comfortaa.Bold, size: 18)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.textColor = UIColor.label
        labelEmail.font =  UIFont(name: Comfortaa.Bold, size: 18)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(labelEmail)
    }
    
    func setupPasswordLabel() {
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.textColor = UIColor.label
        labelPassword.font =  UIFont(name: Comfortaa.Bold, size: 18)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(labelPassword)
    }
    
    func setupLabelRepeatPassword() {
        labelRepeatPassword = UILabel()
        labelRepeatPassword.text = "Repeat Password"
        labelRepeatPassword.textColor = UIColor.label
        labelRepeatPassword.font =  UIFont(name: Comfortaa.Bold, size: 18)
        labelRepeatPassword.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(labelRepeatPassword)
    }
    
    func setupTextFieldName(){
        textFieldName = InputField()
        wrapperView.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = InputField()
        wrapperView.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = InputField()
        textFieldPassword.isSecureTextEntry = true
        wrapperView.addSubview(textFieldPassword)
    }
    
    func setupTextFieldRepeatPassword() {
        textFieldRepeatPassword = InputField()
        textFieldRepeatPassword.isSecureTextEntry = true
        wrapperView.addSubview(textFieldRepeatPassword)
    }
    
    func setupButtonNext(){
        buttonNext = SubmitButton()
        wrapperView.addSubview(buttonNext)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            wrapperView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            
            labelName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            labelName.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldName.heightAnchor.constraint(equalToConstant: 40),
            
            labelEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 32),
            labelEmail.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 40),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 32),
            labelPassword.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 40),
            
            
            labelRepeatPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
            labelRepeatPassword.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            textFieldRepeatPassword.topAnchor.constraint(equalTo: labelRepeatPassword.bottomAnchor, constant: 16),
            textFieldRepeatPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textFieldRepeatPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldRepeatPassword.heightAnchor.constraint(equalToConstant: 40),
            
            takePhotoLabel.topAnchor.constraint(equalTo: textFieldRepeatPassword.bottomAnchor, constant: 32),
            takePhotoLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: takePhotoLabel.bottomAnchor, constant: 16),
            buttonTakePhoto.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            buttonNext.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 32),
            buttonNext.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            buttonNext.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonNext.heightAnchor.constraint(equalToConstant: 48),
            buttonNext.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -32)
            
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
