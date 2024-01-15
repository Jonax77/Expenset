//
//  ProfileFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/23/23.
//

import Foundation
import FirebaseAuth
import UIKit

extension ProfileViewController {
    func getCurrentUser() {
        handleAuth = Auth.auth().addStateDidChangeListener{ _, user in
            if let currentUser = user {
                self.profileView.nameLabel.text = currentUser.displayName
            
                if let photoURL = currentUser.photoURL {
                    self.profileView.profileImage.loadRemoteImage(from: photoURL)
                }
            }
            
        }
    }
}
