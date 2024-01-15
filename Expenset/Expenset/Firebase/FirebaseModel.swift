//
//  FirebaseModel.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/3/23.
//

import Foundation
import FirebaseFirestore

struct User: Codable {
//    enum Sex {
//        case male
//        case female
//        case x
//        
//        init?(rawValue: String) {
//            switch rawValue {
//                case "male": self = .male
//                case "female": self = .female
//                case "x": self = .x
//                default: return nil
//            }
//        }
//    }
    
    @DocumentID var id: String?
    var email: String
    var displayName: String
//    var sex: Sex?
    var country: String?
    var address: String?
    var zip: String?
}

struct Category: Codable {
    enum CategoryType: Codable {
        case income
        case expense
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            
            switch rawValue {
            case "income": self = .income
            case "expense": self = .expense
            default: throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid category type: \(rawValue)"
            )
            }
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .income:
                try container.encode("income")
            case .expense:
                try container.encode("expense")
            }
        }
        
        func stringValue() -> String {
            switch self {
            case .income: return "income"
            case .expense: return "expense"
            }
        }
    }

    var name: String
    var type: CategoryType
}

struct Transaction: Codable {
    @DocumentID var id: String?
    var amount: Double
    var categoryName: String
    var categoryType: Category.CategoryType
    var description: String
    var timestamp: Timestamp
    var image: URL? // image link
}

struct WeeklyResult: Identifiable {
    let id = UUID()
    var dateString: String
    var totalAmount: Double

}

struct MonthlyCategoryResult: Identifiable {
    let id = UUID()
    var name: String
    var totalAmount: Double
}

struct TransactionSummary: Identifiable {
    let id = UUID()
    var timestamp: Date
    var categoryType: Category.CategoryType
    var categoryName: String
    var totalAmount: Double = 0 // 设置默认值为0
    
    
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return  dateFormatter.string(from: timestamp)
    }
    
    var shortDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return  dateFormatter.string(from: timestamp)
    }
}



enum TimeRange: String, CaseIterable {
    case allTime = "All Time"
    case today = "Today"
    case oneWeek = "One Week"
    case oneMonth = "One Month"
    case threeMonths = "Three Months"
    case oneYear = "One Year"

    func getName() -> String {
        return self.rawValue
    }

    func getTimeRange() -> Int {
        switch self {
            case .allTime: return -1
            case .today: return 1// Example: -1 represents all time
            case .oneWeek: return 7 // Example: 7 days in a week
            case .oneMonth: return 30 // Example: 30 days in a month
            case .threeMonths: return 90 // Example: 90 days in three months
            case .oneYear: return 365 // Example: 365 days in a year
        }
    }
}
