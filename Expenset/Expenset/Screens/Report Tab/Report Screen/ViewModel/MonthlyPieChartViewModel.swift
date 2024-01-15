//
//  MonthlyPieChartViewModel.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/10/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class MonthlyPieChartViewModel: ObservableObject {
    @Published var data: [MonthlyCategoryResult] = [] 
        
    private var listener: ListenerRegistration?
    private let db = Firestore.firestore()

    init() {
        fetchData()
    }
    
    deinit {
        listener?.remove()
    }
    
    func fetchData() {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        let today = Calendar.current.startOfDay(for: Date())
        let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: today) ?? Date()
        
        listener = collectionRef
            .whereField("timestamp", isGreaterThan: oneMonthAgo)
            .addSnapshotListener({ (querySnapshot, error) in
                if let error = error {
                    print("Error fetching documents: \(error)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                var summaryByCategory: [String : MonthlyCategoryResult] = [:]
                
                for document in documents {
                    do {
                        let transaction = try document.data(as: Transaction.self)
                        
                        let categoryName = transaction.categoryName
                        let categoryType = transaction.categoryType
                        let timestamp = transaction.timestamp
                        let amount = transaction.amount
                        
                        if categoryType == .expense {
                            if summaryByCategory[categoryName] == nil {
                                // Create a new TransactionSummary for this category type
                                let newSummary = MonthlyCategoryResult(name: categoryName, totalAmount: amount)
                                summaryByCategory[categoryName] = newSummary
                            } else {
                                summaryByCategory[categoryName]?.totalAmount += transaction.amount
                            }
                        }
                        
                        
                    } catch {
                        print("Error decoding category: \(error)")
                    }
                }
                
                
                // Get the top five categories based on total amount
                let sortedCategories = summaryByCategory.values.sorted(by: { $0.totalAmount > $1.totalAmount })
                
                self.data = sortedCategories
                
            })

    }
}
