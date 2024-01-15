//
//  TransactionDetailFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension TransactionDetailViewController {
    func deleteTransaction() {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        guard let transactionID = transaction.id else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions").document(transactionID)
        
        self.showActivityIndicator()
        
        collectionRef.delete { error in
                if let error = error {
                    self.hideActivityIndicator()
                    // Handle error during deletion
                    self.presentAlertWithTitle("Error", message: "Error deleting transaction: \(error.localizedDescription)")
                } else {
                    self.hideActivityIndicator()
                    // Deletion successful
                    self.presentAlertWithTitle("Success", message: "Transaction deleted successfully!")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        
    }
}
