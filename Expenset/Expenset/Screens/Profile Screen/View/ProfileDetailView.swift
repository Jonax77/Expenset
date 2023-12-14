//
//  ProfileDetailView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/11/23.
//

import UIKit

class ProfileDetailView: UIView {

    var profilePic: UIImageView!
    var nameLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        setupProfilePic()
        setUpNameLabel()

    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            profilePic.widthAnchor.constraint(equalToConstant: 200),
            profilePic.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        
    }

    func setupProfilePic(){
        profilePic = UIImageView(image: UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.label))
        profilePic.contentMode = .scaleAspectFit
        profilePic.clipsToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        nameLabel.textColor = UIColor.label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
}
