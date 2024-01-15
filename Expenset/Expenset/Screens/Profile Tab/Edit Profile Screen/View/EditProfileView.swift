//
//  EditProfileView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/11/23.
//

import UIKit

class EditProfileView: UIView {
    
    var profilePic: UIButton!
    var nameLabel: UILabel!
    var nameField: UITextField!
    var submitButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.systemBackground
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        setupProfilePic()
        setUpNameLabel()
        setupNameField()
        setUpSubmitButton()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            profilePic.widthAnchor.constraint(equalToConstant: 200),
            profilePic.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            
            submitButton.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 40),
            submitButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 48)
        ])

    }

    func setupProfilePic(){
        profilePic = CircularButton()
        profilePic.setImage(UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.label), for: .normal)
        profilePic.contentHorizontalAlignment = .fill
        profilePic.contentVerticalAlignment = .fill
        profilePic.imageView?.contentMode = .scaleAspectFit
        profilePic.imageView?.clipsToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.font = UIFont(name: Comfortaa.Bold, size: 18)
        nameLabel.textColor = UIColor.label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
    
    func setupNameField(){
        nameField = InputField()
        self.addSubview(nameField)
    }
    
    func setUpSubmitButton(){
        submitButton = SubmitButton()
        self.addSubview(submitButton)
    }
}

#Preview {
    EditProfileViewController()
}
