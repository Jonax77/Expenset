//
//  ProfileDetailFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/26/23.
//

import Foundation
import FirebaseAuth

extension ProfileDetailViewController {
    func getCurrentUser() {
        handleAuth = Auth.auth().addStateDidChangeListener{ _, user in
            if let currentUser = user {
                self.detailView.emailValueLabel.text = currentUser.email
                self.detailView.nameValueLabel.text = currentUser.displayName
            
                if let photoURL = currentUser.photoURL {
                    self.detailView.profilePic.loadRemoteImage(from: photoURL)
                }
            }
            
        }
    }
}
