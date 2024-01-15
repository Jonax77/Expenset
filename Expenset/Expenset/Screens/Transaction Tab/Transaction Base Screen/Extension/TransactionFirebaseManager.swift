//
//  TransactionFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/29/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

extension TransactionViewController {
    
    func getTransactionBySearch(with searchText: String) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        transactionListener?.remove()
        
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !trimmedSearchText.isEmpty {
            // Convert search text to lowercase for case-insensitive comparison
            let lowercaseSearchText = trimmedSearchText.capitalized
            
            let _ = print(lowercaseSearchText)

            // Apply a filter based on the description containing the search text
            let query = collectionRef.whereField("categoryName", isGreaterThanOrEqualTo: lowercaseSearchText)
                                    .whereField("categoryName", isLessThan: lowercaseSearchText + "z")

            // Start listening to changes in the filtered query
            transactionListener = query.addSnapshotListener { querySnapshot, error in
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
                        print("Error decoding transaction: \(error)")
                    }
                }
                
                self.transactionView.transactionTableView.reloadData()
            }
        }
        
    }
    
    func getTransactionByCategory(filterCategory: Category?) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        transactionListener?.remove()
        
        var query: Query = collectionRef
        
        if filterCategory != nil {
            query = collectionRef.whereField("categoryName", isEqualTo: filterCategory!.name)
        }
        
        query = query.order(by: "timestamp", descending: true)
        
        transactionListener = query.addSnapshotListener({ querySnapshot, error in
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
            
            self.transactionView.transactionTableView.reloadData()
        })
        
    }
    
    func getTransactionByTimeRange(filterTimeRange: TimeRange) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        transactionListener?.remove()
        
        var query: Query = collectionRef
        
        if filterTimeRange != .allTime {
            // Get the time range in days from the filterTimeRange enum case
            let timeRange = filterTimeRange.getTimeRange()
            
            // Calculate the date in the past based on the time range
            let pastDate = Calendar.current.date(byAdding: .day, value: -timeRange, to: Date()) ?? Date()
            
            // Apply a filter for transactions after the calculated past date
            query = query.whereField("timestamp", isGreaterThan: pastDate)
        }
        
        query = query.order(by: "timestamp", descending: true)
        
        transactionListener = query.addSnapshotListener( { querySnapshot, error in
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
            
            self.transactionView.transactionTableView.reloadData()
            self.setupTimeRangeMenu()
        })
    }
    
    func getAllCategories() {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let collectionRef = db.collection("users").document(currentUserID).collection("categories")
        
        categoryListener = collectionRef.addSnapshotListener({ querySnapshot, error in
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

            for document in documents {
                do {
                    let category = try document.data(as: Category.self)
                    self.categories.append(category)
                } catch {
                    print("Error decoding category: \(error)")
                }
            }
            
            self.setupCategoryMenu()
            
            
        })
     }
    
    func setupTimeRangeMenu() {
        timeRangeMenuItems = TimeRange.allCases.map { timeRange in
            return UIAction(title: timeRange.getName(), handler: { _ in
                self.getTransactionByTimeRange(filterTimeRange: timeRange)
            })
        }
        
        timeRangeMenu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: timeRangeMenuItems)
        timeRangeMenu.preferredElementSize = .large
        
        self.transactionView.timeRangeMenuButton.menu = timeRangeMenu
        self.transactionView.timeRangeMenuButton.showsMenuAsPrimaryAction = true
    }
    
    func setupCategoryMenu() {
        self.categoryMenuItems = self.categories.map { category in
            return UIAction(title: category.name, handler: { _ in
                // Call a function and pass the title as an attribute
                self.getTransactionByCategory(filterCategory: category)
            })
        }
        
        let all = UIAction(title: "All", handler: { _ in
            self.getTransactionByCategory(filterCategory: nil)
        })
        
        categoryMenuItems = [all] + categoryMenuItems
    
        categoryMenu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: categoryMenuItems)
        categoryMenu.preferredElementSize = .large
        
        self.transactionView.categoryMenuButton.menu = categoryMenu
        self.transactionView.categoryMenuButton.showsMenuAsPrimaryAction = true
    }
    

}
