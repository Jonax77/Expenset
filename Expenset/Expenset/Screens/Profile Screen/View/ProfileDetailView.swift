//
//  ProfileDetailView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/11/23.
//

import UIKit

class ProfileDetailView: UIView {
    
//    @DocumentID var id: String?
//    var email: String
//    var displayName: String
//    var sex: Sex?
//    var country: String?
//    var address: String?
//    var zip: String?
    
    var wrapperView: UIScrollView!
    var profilePic: UIImageView!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var nameValueLabel: UILabel!
    var emailValueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(user: User) {
        
    }
    
    func setUpViews() {
        setupWrapperView()
        setupProfilePic()
        setUpNameLabel()
        setupEmailLabel()
        setUpNameValueLabel()
        setUpEmailValueLabel()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            wrapperView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            profilePic.widthAnchor.constraint(equalToConstant: 200),
            profilePic.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 32),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            nameValueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameValueLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
            emailValueLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 8),
            emailValueLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
        ])
        
        
    }
    
    func setupWrapperView() {
        wrapperView = UIScrollView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperView)
    }

    func setupProfilePic(){
        profilePic = UIImageView(image: UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.label))
        profilePic.contentMode = .scaleAspectFit
        profilePic.clipsToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(profilePic)
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        nameLabel.textColor = UIColor.label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(nameLabel)
    }
    
    func setUpNameValueLabel() {
        nameValueLabel = UILabel()
        nameValueLabel.text = "Name:"
        nameValueLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        nameValueLabel.textColor = UIColor.label
        nameValueLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(nameValueLabel)
    }
    
    func setUpEmailValueLabel() {
        emailValueLabel = UILabel()
        emailValueLabel.text = "Name:"
        emailValueLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        emailValueLabel.textColor = UIColor.label
        emailValueLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(emailValueLabel)
    }
    
    func setupEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email:"
        emailLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        emailLabel.textColor = UIColor.label
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(emailLabel)
    }
    
    func setupAgeLabel() {
        
    }
}

#Preview {
    ProfileDetailViewController()
}
