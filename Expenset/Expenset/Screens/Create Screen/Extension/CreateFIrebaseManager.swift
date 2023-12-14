//
//  CreateFIrebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/12/23.
//

import Foundation
import FirebaseStorage

extension CreateViewController {
    
    func uploadPhotoToStorage() {
        var PhotoURL:URL?
        
        self.showActivityIndicator()
        
        //MARK: Upload the profile photo if there is any...
//        if let image = pickedImage, let name = self.editProfileView.nameField.text {
//            if let jpegData = image.jpegData(compressionQuality: 80){
//                let storageRef = storage.reference()
//                let imagesRepo = storageRef.child("imagesUsers")
//                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
//                
//                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
//                    if error == nil{
//                        imageRef.downloadURL(completion: {(url, error) in
//                            if error == nil{
//                                profilePhotoURL = url
//                                self.updateNameAndPhotoOfTheUserInFirebaseAuth(name: name, photoURL: profilePhotoURL)
//                            }
//                        })
//                    } else {
//                        self.hideActivityIndicator()
//                        let _ = print(error.debugDescription)
//                        self.presentAlertWithTitle("Error", message: "Fail to upload profile.")
//                        
//                    }
//                })
//            }
//        }
//        
    }
}
