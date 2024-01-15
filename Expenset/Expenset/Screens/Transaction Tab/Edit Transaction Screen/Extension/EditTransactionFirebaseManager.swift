//
//  EditTransactionFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

extension EditTransactionViewController {
    
    func addCategoryListener() {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let collectionRef = db.collection("users").document(currentUserID).collection("categories").order(by: "name")
        
        
        listener = collectionRef.addSnapshotListener({ querySnapshot, error in
            if let error = error {
                   print("Error fetching documents: \(error)")
                   return
               }

           guard let documents = querySnapshot?.documents else {
               print("No documents")
               return
           }

           // Process retrieved documents
            self.categories.removeAll()

            // Loop through each document and decode into Category objects
            for document in documents {
                do {
                    let category = try document.data(as: Category.self)
                    self.categories.append(category)
                    let _ = print(self.categories.count)
                } catch {
                    print("Error decoding category: \(error)")
                }
            }
            
            // Update the picker view's data source
            DispatchQueue.main.async {
                self.editView.categoryPicker.reloadAllComponents()
                if !self.categories.isEmpty {
                    self.selectedCategory = self.categories[0]
                }// Reload the picker view
            }
        })
    }
    
    func removeCategoryListener() {
        listener?.remove()
    }
    
    func updateTransaction(amount: Double, category: Category, timestamp: Date, description: String, photoURL: URL?) {
        let newTransaction = Transaction(amount: amount, categoryName: category.name, categoryType: category.type, description: description, timestamp: Timestamp(date: timestamp), image: photoURL)
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        guard let transactionID = originalTransaction.id else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions").document(transactionID)
        
        do {
            // update a new transaction document under the user's document
            try collectionRef.setData(from: newTransaction, merge: true) { error in
                if let error = error {
                    self.hideActivityIndicator()
                    self.presentAlertWithTitle("Error", message: "Error updating transaction: \(error)")
                } else {
                    self.hideActivityIndicator()
                    self.clearInput()
                    self.presentAlertWithTitle("Success", message: "Transaction updated successfully!")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        } catch {
            self.presentAlertWithTitle("Error", message: "Error encoding transaction: \(error)")
            self.hideActivityIndicator()
        }
    }
    
    func uploadPhotoToStorageIfNeeded() {
        var photoURL:URL?
        
        self.showActivityIndicator()
        
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
//        MARK: Upload the photo if there is any...
        if let image = pickedImage {
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("users/\(currentUserID)/transactionImages") // Store under "users/userID/transactionImages"
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")

                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                photoURL = url
                                guard let amountText = self.editView.amountField.text,
                                   let amountValue = Double(amountText) else { return }
                                
                                self.updateTransaction(amount: amountValue, category: self.selectedCategory!, timestamp: self.selectedDate!, description: self.editView.descriptionTextView.text, photoURL: photoURL)
                            }
                        })
                    } else {
                        self.hideActivityIndicator()
                        let _ = print(error.debugDescription)
                        self.presentAlertWithTitle("Error", message: "Fail to upload image.")
                        
                    }
                })
            }
        } else {
            guard let amountText = self.editView.amountField.text,
               let amountValue = Double(amountText) else { return }
            
            self.updateTransaction(amount: amountValue, category: self.selectedCategory!, timestamp: self.selectedDate!, description: self.editView.descriptionTextView.text, photoURL: photoURL)
        }
        
    }
}
