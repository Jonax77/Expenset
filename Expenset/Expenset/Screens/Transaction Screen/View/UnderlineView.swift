//
//  UnderlineView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/13/23.
//

import Foundation
import UIKit

class UnderlineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.label // Set your underline color
        alpha = 0 // Initially hide the underline
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showUnderline() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1 // Show the underline with animation
        }
    }

    func hideUnderline() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0 // Hide the underline with animation
        }
    }
}
