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
    var createdTime: Date
    var image: String? // image link
}

struct totalByCategory: Identifiable {
    let id = UUID()
    var name: String
    var value: Double
}
