//
//  AddNewCategoryFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/29/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension AddNewCategoryViewController {
    
    func addNewCategory() {
        self.showActivityIndicator()
        
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let collectionRef = db.collection("users").document(currentUserID).collection("categories")
        
        // Get the name for the category
        guard let categoryName = addNewCategoryView.nameField.text, !categoryName.isEmpty else {
            self.presentAlertWithTitle("Error", message: "Category name cannot be empty")
            self.hideActivityIndicator()
            return
        }
        
        // Check if the document with categoryName already exists
        collectionRef.document(categoryName).getDocument { document, error in
            if let error = error {
                self.presentAlertWithTitle("Error", message: "Error fetching category: \(error)")
                self.hideActivityIndicator()
                return
            }
            
            if let _ = document, document!.exists {
                self.presentAlertWithTitle("Error", message: "Category with name '\(categoryName)' already exists!")
                self.hideActivityIndicator()
            } else {
                // Create a dictionary with other category properties
                let newCategory = Category(name: categoryName, type: self.selectedType) // Replace with your actual values
                let categoryData: [String: Any] = try! Firestore.Encoder().encode(newCategory)

                
                // Set the category document with the name as the ID
                collectionRef.document(categoryName).setData(categoryData) { error in
                    if let error = error {
                        self.presentAlertWithTitle("Error", message: "Error adding category: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true)
                        }
                    }
                    self.hideActivityIndicator()
                }
            }
        }
    }
}
