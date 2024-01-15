//
//  WeeklyLineChartViewModel.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/10/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class WeeklyLineChartViewModel: ObservableObject {

    
    @Published var expenseData: [WeeklyResult] = []
    @Published var incomeData: [WeeklyResult] = []
        
    private var listener: ListenerRegistration?
    private let db = Firestore.firestore()

    init() {
        fetchData()
    }
    
    deinit {
        listener?.remove()
    }
    
    func fetchData() {
        // fetch weekly data of income and expense.
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        
        let collectionRef = db.collection("users").document(currentUserID).collection("transactions")
        
        let today = Calendar.current.startOfDay(for: Date())
        let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) ?? Date()
        
        listener = collectionRef
            .whereField("timestamp", isGreaterThan: oneWeekAgo)
            .addSnapshotListener({ (querySnapshot, error) in
                if let error = error {
                    print("Error fetching documents: \(error)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                let _ = print("transaction size = \(documents.count)")
                
                var expenseSummaryByDay: [String: Double] = [:]
                var incomeSummaryByDay: [String: Double] = [:]
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd" // Format for grouping by day
                
                // Process retrieved documents
                for document in documents {
                    do {
                        let transaction = try document.data(as: Transaction.self)
                        let categoryName = transaction.categoryName
                        let dateString = dateFormatter.string(from: transaction.timestamp.dateValue())
                        let categoryType = transaction.categoryType
                        let amount = transaction.amount
                        
                        if categoryType == .expense {
                            if expenseSummaryByDay[dateString] == nil {
                                expenseSummaryByDay[dateString] = amount
                            } else {
                                expenseSummaryByDay[dateString] = expenseSummaryByDay[dateString]! + amount
                            }
                        } else if categoryType == .income {
                            if incomeSummaryByDay[dateString] == nil {
                                incomeSummaryByDay[dateString] = amount
                            } else {
                                incomeSummaryByDay[dateString] = incomeSummaryByDay[dateString]! + amount
                            }
                        }
                         
                         
                    } catch {
                        print("Error decoding category: \(error)")
                    }

                }
                

                // Get the start day seven days ago
                    let startDay = Calendar.current.component(.weekday, from: oneWeekAgo)
                    
                    // Convert the start day to a string (assuming 1 is Sunday, 2 is Monday, ..., 7 is Saturday)
                    let startDayString = Calendar.current.shortWeekdaySymbols[startDay - 1]
                    
                    // Define the days of the week
                    let allDaysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                    
                    // Rotate the days of the week array based on the desired starting day
                let orderedDaysOfWeek = self.rotateDaysOfWeek(startingFrom: startDayString, allDays: allDaysOfWeek)
                
                let tupleExpenseArray = expenseSummaryByDay.map { (dateString, totalAmount) in
                    return (dateString, totalAmount)
                }
                // Step 2: Sort the array based on date strings
                let sortedExpenseArray = tupleExpenseArray.sorted { $0.0 < $1.0 }
                
                let sortedExpenseByDay = expenseSummaryByDay.sorted { dateFormatter.date(from: $0.key)! < dateFormatter.date(from: $1.key)! }
                
                let weeklyExpenseResults = sortedExpenseByDay.map { (dateString, totalAmount) in
                    // Parse the date string and format it to EEE
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let date = dateFormatter.date(from: dateString) {
                        dateFormatter.dateFormat = "EEE"
                        let weekday = dateFormatter.string(from: date)
                        return WeeklyResult(dateString: weekday, totalAmount: totalAmount)
                    } else {
                        return WeeklyResult(dateString: dateString, totalAmount: totalAmount)
                    }

                }
                
                let tupleIncomeArray = incomeSummaryByDay.map { (dateString, totalAmount) in
                    return (dateString, totalAmount)
                }

                // Step 2: Sort the array based on date strings
                let sortedIncomeArray = tupleIncomeArray.sorted { $0.0 < $1.0 }

                let sortedIncomeByDay = incomeSummaryByDay.sorted { dateFormatter.date(from: $0.key)! < dateFormatter.date(from: $1.key)! }

                let weeklyIncomeResults = sortedIncomeByDay.map { (dateString, totalAmount) in
                    // Parse the date string and format it to EEE
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    if let date = dateFormatter.date(from: dateString) {
                        dateFormatter.dateFormat = "EEE"
                        let weekday = dateFormatter.string(from: date)
                        return WeeklyResult(dateString: weekday, totalAmount: totalAmount)
                    } else {
                        return WeeklyResult(dateString: dateString, totalAmount: totalAmount)
                    }
                }


                DispatchQueue.main.async {
                    self.expenseData = weeklyExpenseResults
                    self.incomeData = weeklyIncomeResults
                }
            })
    }
    
    func rotateDaysOfWeek(startingFrom: String, allDays: [String]) -> [String] {
        guard let startIndex = allDays.firstIndex(of: startingFrom) else {
            return allDays
        }
        return Array(allDays[startIndex..<allDays.count] + allDays[..<startIndex])
    }
}
