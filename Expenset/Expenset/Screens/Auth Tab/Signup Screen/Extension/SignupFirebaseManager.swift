//
//  SignupFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import Foundation
import FirebaseAuth
import UIKit

extension SignupViewController {
    func uploadProfilePhotoToStorageIfNeeded() {
        var profilePhotoURL:URL?
        
        self.showActivityIndicator()
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage {
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.registerNewAccount(photoURL: profilePhotoURL)
                            } else {
                                self.hideActivityIndicator()
                                let _ = print(error.debugDescription)
                                self.presentAlertWithTitle("Error", message: "Fail to upload profile.")
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
            registerNewAccount(photoURL: profilePhotoURL)
        }
        
    }
    
    func registerNewAccount(photoURL: URL?) {
        
        // MARK: create a Firebase user with email and password...
        if let name = signupView.textFieldName.text,
           let email = signupView.textFieldEmail.text,
           let password = signupView.textFieldPassword.text {
            // Validations....
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                guard let self = self else { return }
                if error == nil, let id = result?.user.uid {
                    // User created in Auth, now add to Firestore
                    self.createNewUserInFirestore(id: id, email: email, displayName: name, photoURL: photoURL)
                } else {
                    // MARK: there is an error creating the user...
                    print(error.debugDescription)
                    self.hideActivityIndicator()
                }
            }
        }
    }
    
    func createNewUserInFirestore(id: String, email: String, displayName: String, photoURL: URL?) {
        let ref = db.collection("users")
        
        ref.document(id).setData([
            "id": id,
            "email": email,
            "displayName": displayName
        ]) { error in
            if let error = error {
                // Handle error if needed
                self.hideActivityIndicator()
                self.presentAlertWithTitle("Error", message: error.localizedDescription)
                print("Error creating user in Firestore: \(error)")
            } else {
                self.setNameAndPhotoOfTheUserInFirebaseAuth(name: displayName, photoURL: photoURL)
            }
        }
    }
    
    func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, photoURL: URL?) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: { [weak self] error in
            guard let self = self else { return }
            if error == nil {
                // MARK: the profile update is successful...
                let alert = UIAlertController(title: "Success", message: "Your action was successful", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)

                // Dismiss the alert after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    alert.dismiss(animated: true) {
                        // Pop the view controller
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } else {
                // MARK: there was an error updating the profile...
                print("Error occurred while setting display name: \(String(describing: error))")
                self.hideActivityIndicator()
                self.presentAlertWithTitle("Error", message: error!.localizedDescription)
            }
        })
    }
    
}
