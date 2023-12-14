//
//  ProfileView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class ProfileView: UIView {
    
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var logoutButton: UIButton!
    var profileButton: UIButton!
    var settingButton: UIButton!
    var aboutButton: UIButton!
    var contactButton: UIButton!
    var dividerLine: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupProfileImage()
        setupNameLabel()
        setupDivider()
        setupProfileButton()
        setupSettingButton()
        setupContactButton()
        setupAboutButton()
        setupLogoutButton()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            
            dividerLine.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            dividerLine.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            dividerLine.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 24),
            dividerLine.heightAnchor.constraint(equalToConstant: 0.5),
            
            profileButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 60),
            profileButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            
            settingButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 24),
            settingButton.leadingAnchor.constraint(equalTo: profileButton.leadingAnchor),
            
            contactButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 24),
            contactButton.leadingAnchor.constraint(equalTo: profileButton.leadingAnchor),
            
            aboutButton.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 24),
            aboutButton.leadingAnchor.constraint(equalTo: profileButton.leadingAnchor),

            logoutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60),
         
            logoutButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48)
                ])
    }
    
    func setupDivider() {
        dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.label
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dividerLine)
    }
    
    func setupProfileImage() {
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.cornerRadius = profileImage.bounds.height
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileImage)
    }
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.numberOfLines = 1
        nameLabel.textColor = UIColor.label
        nameLabel.text = "Jon Doe"
        nameLabel.font = UIFont(name: Comfortaa.Bold, size: 28)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
    
    func setupAboutButton() {
        aboutButton = UIButton(type: .system)
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let icon = UIImage(systemName: "questionmark.bubble.fill", withConfiguration: iconConfiguration)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        aboutButton.setImage(icon, for: .normal)
        aboutButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        aboutButton.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 16)
        aboutButton.setTitleColor(UIColor.label, for: .normal)
        aboutButton.setTitle("About", for: .normal)
        
        self.addSubview(aboutButton)
    }
    
    func setupContactButton() {
        contactButton = UIButton(type: .system)
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let icon = UIImage(systemName: "phone.arrow.right", withConfiguration: iconConfiguration)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        contactButton.setImage(icon, for: .normal)
        contactButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        contactButton.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 16)
        contactButton.setTitleColor(UIColor.label, for: .normal)
        contactButton.setTitle("Contact Us", for: .normal)
        
        self.addSubview(contactButton)
    }
    
    func setupProfileButton() {
        profileButton = UIButton(type: .system)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let icon = UIImage(systemName: "person.fill", withConfiguration: iconConfiguration)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        profileButton.setImage(icon, for: .normal)
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        profileButton.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 16)
        profileButton.setTitleColor(UIColor.label, for: .normal)
        profileButton.setTitle("View Profile", for: .normal)
        
        self.addSubview(profileButton)
    }
    
    func setupSettingButton() {
        settingButton = UIButton(type: .system)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let icon = UIImage(systemName: "gearshape.fill", withConfiguration: iconConfiguration)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        settingButton.setImage(icon, for: .normal)
        settingButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        settingButton.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 16)
        settingButton.setTitleColor(UIColor.label, for: .normal)
        settingButton.setTitle("Setting", for: .normal)
        
        self.addSubview(settingButton)
    }
    
    func setupLogoutButton() {
        logoutButton = UIButton(type: .system)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
        let icon = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill", withConfiguration: iconConfiguration)?.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)
        logoutButton.setImage(icon, for: .normal)
        logoutButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        logoutButton.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 16)
        logoutButton.setTitleColor(UIColor.red, for: .normal)
        logoutButton.setTitle("Log out", for: .normal)
        
        self.addSubview(logoutButton)
    }

}
