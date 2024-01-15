//
//  ReportViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class ReportViewController: UIViewController {
    
    let childProgressView = LoadingViewController()
    
    var transactions: [Transaction] = []
    
    
    let db = Firestore.firestore()
    
    let hostingController: UIHostingController<ReportView>
        
        init() {
            hostingController = UIHostingController(rootView: ReportView())
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.frame = view.bounds
            hostingController.didMove(toParent: self)
        
        setupTitle()

    }
 
    

    private func setupTitle() {
        let title = "Report"
        let attributedString = NSMutableAttributedString(string: title)
        
        // Apply attributes to the attributed string
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label, // Change text color
            .font: UIFont(name: Comfortaa.Bold, size: 16)// Change font and size
            // Add more attributes if needed
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: title.count))
        
        // Create a label with the attributed string
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedString
        titleLabel.sizeToFit() // Adjust the label size to fit the attributed text
        
        // Set the label as the title view of the navigation item
        navigationItem.titleView = titleLabel
    }

}
