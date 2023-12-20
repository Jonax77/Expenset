//
//  SubmitButton.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/16/23.
//

import UIKit

class SubmitButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
    
    private func setupButton() {
        self.setTitle("Submit", for: .normal)
        self.backgroundColor = UIColor.label // A blueish color
        self.setTitleColor(UIColor.systemBackground, for: .normal)
        self.layer.cornerRadius = 10 // Adjust this value to get the desired roundness
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.25
        self.titleLabel?.font = UIFont(name: Comfortaa.Bold, size: 18)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
