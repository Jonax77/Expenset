//
//  InputField.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/16/23.
//

import Foundation
import UIKit

class InputField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.textColor = UIColor.label
        self.font = UIFont(name: Comfortaa.Regular, size: 18)
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.label.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
