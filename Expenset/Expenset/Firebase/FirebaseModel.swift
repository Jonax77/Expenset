//
//  FirebaseModel.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/3/23.
//

import Foundation
import FirebaseFirestore

struct User {
    enum Sex {
        case male
        case female
        case x
        
        init?(rawValue: String) {
            switch rawValue {
                case "male": self = .male
                case "female": self = .female
                case "x": self = .x
                default: return nil
            }
        }
    }
    
    @DocumentID var id: String?
    var email: String
    var displayName: String
    var sex: Sex?
    var country: String?
    var address: String?
    var zip: String?
}

struct Category {
    enum CategoryType {
        case income
        case expense
        
        init?(rawValue: String) {
            switch rawValue {
                case "income": self = .income
                case "expense": self = .expense
                default: return nil
            }
            
        }
        
        var stringValue: String {
            switch self {
                case .income: return "income"
                case .expense: return "expense"
            }
        }
    }
    
    @DocumentID var id: String?
    var name: String
    var type: CategoryType
}

struct Transaction {
    @DocumentID var id: String?
    var amount: Double
    var category: Category
    var description: String?
    var timestamp: Date
    var image: String? // image link
}

struct TransactionSummary: Identifiable {
    let id = UUID()
    var startDate: Date
    var endDate: Date
    var type: Category.CategoryType
    var category: Category?
    var totalAmount: Double = 0 // 设置默认值为0
    
    
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return  dateFormatter.string(from: startDate)
    }
    
    var shortDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return  dateFormatter.string(from: startDate)
    }
}
