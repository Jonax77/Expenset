//
//  CreatePickerManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/12/23.
//

import Foundation
import UIKit

extension CreateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = UIColor.label // Set your desired text color
        label.font = UIFont(name: Comfortaa.Regular, size: 20) // Set your desired font size
        label.textAlignment = .left
        label.text = categoryData[row]
        
        return label
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCategory = categoryData[row]
    }
    

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
       return 42.0
    }
}
