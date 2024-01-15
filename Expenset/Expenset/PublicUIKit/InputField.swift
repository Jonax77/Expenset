//
//  InputField.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/16/23.
//

import Foundation
import UIKit

class InputField: UITextField {
    var leftPadding: CGFloat = 10.0 // Adjust the desired left padding here

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.textColor = UIColor.label
        self.font = UIFont(name: "Comfortaa-Regular", size: 18)
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.label.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            // Adjust border color for light/dark mode
            self.layer.borderColor = UIColor.label.cgColor
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: leftPadding, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: leftPadding, dy: 0)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
