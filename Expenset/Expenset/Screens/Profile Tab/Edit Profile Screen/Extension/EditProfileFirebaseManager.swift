//
//  EditProfileFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/17/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

extension EditProfileViewController {
    func getCurrentProfile() {
        let currentUser = Auth.auth().currentUser
        
        let name = currentUser?.displayName
        
        self.editProfileView.nameField.text = name
        
        guard let photoURL = currentUser?.photoURL else {
            return
        }
        
        self.editProfileView.profilePic.loadRemoteImage(from: photoURL)
    }
    
    func uploadProfilePhotoToStorage() {
        var profilePhotoURL:URL?
        
        self.showActivityIndicator()
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage, let name = self.editProfileView.nameField.text {
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.updateNameAndPhotoOfTheUserInFirebaseAuth(name: name, photoURL: profilePhotoURL)
                            }
                        })
                    } else {
                        self.hideActivityIndicator()
                        let _ = print(error.debugDescription)
                        self.presentAlertWithTitle("Error", message: "Fail to upload profile.")
                        
                    }
                })
            }
        }else{
            self.updateNameAndPhotoOfTheUserInFirebaseAuth(name: editProfileView.nameField.text!, photoURL: profilePhotoURL)
        }
        
    }
    
    func updateNameAndPhotoOfTheUserInFirebaseAuth(name: String, photoURL: URL?) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        
        if photoURL != nil {
            changeRequest?.photoURL = photoURL
        }
        
        changeRequest?.commitChanges(completion: { [weak self] error in
            guard let self = self else { return }
            if error == nil {
                // MARK: the profile update is successful...
                self.hideActivityIndicator()
                self.navigationController?.popViewController(animated: true)
            } else {
                // MARK: there was an error updating the profile...
                self.presentAlertWithTitle("Error", message: "Error occurred while updating.")
                print("Error occurred while setting display name: \(String(describing: error))")
                self.hideActivityIndicator()
            }
        })
    }
}
