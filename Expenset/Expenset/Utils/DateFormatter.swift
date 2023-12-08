//
//  DateFormatter.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/6/23.
//

import Foundation

extension Date {
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm"
        let timestampString = dateFormatter.string(from: self)
        
        return timestampString
        
    }
}
