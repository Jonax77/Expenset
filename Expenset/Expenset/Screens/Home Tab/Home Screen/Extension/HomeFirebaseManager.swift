//
//  HomeFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/23/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension HomeViewController {
    func getBalanceinOneMonth() {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        let currentDate = Date()
        let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) ?? Date()
        
        balanceListener = collectionRef
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
                
                var expenses: Double = 0
                var incomes: Double = 0
                
                // Process retrieved documents
                for document in documents {
                    do {
                        let transaction = try document.data(as: Transaction.self)
                        let categoryType = transaction.categoryType
                         switch categoryType {
                         case .expense:
                             expenses += transaction.amount
                         case .income:
                             incomes += transaction.amount
                         }
                     
                    } catch {
                        print("Error decoding category: \(error)")
                    }
                    

                }
                
                self.homeView.incomeAmountLabel.text = String(Int(incomes))
                self.homeView.expenseAmountLabel.text = String(Int(expenses))
                self.homeView.balanceAmountLabel.text = "$ " + String(Int(incomes - expenses))
                
                print("Expenses within one month: \(expenses)")
                print("Income within one month: \(incomes)")
            })
    }
    
    
    
    func getTransactionByType(filterType: Category.CategoryType) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        var query: Query = collectionRef
        
        query = query.whereField("categoryType", isEqualTo: filterType.stringValue())
        query = query.order(by: "timestamp", descending: true)
        
        transactionsListener?.remove()
        
        transactionsListener = query.addSnapshotListener({ querySnapshot, error in
            if let error = error {
                   print("Error fetching documents: \(error)")
                   return
               }

           guard let documents = querySnapshot?.documents else {
               print("No documents")
               return
           }

           // Process retrieved documents
            self.transactions.removeAll()

            for document in documents {
                do {
                    let transaction = try document.data(as: Transaction.self)
                    self.transactions.append(transaction)
                } catch {
                    print("Error decoding category: \(error)")
                }
            }
            
            self.homeView.transactionTable.reloadData()
        })
    }
    
    func getExpenseAndIncomeByDayInWeek() {

    }

    
}
