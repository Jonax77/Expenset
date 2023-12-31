//
//  HomeViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var transactionData: [Transaction] = [.init(amount: 5000, category: .init(name: "Grocery", type: .expense), createdTime: Date()), .init(amount: 5000, category: .init(name: "Grocery", type: .expense), createdTime: Date())]
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupTitle()
        self.homeView.transactionTable.dataSource = self
        self.homeView.transactionTable.delegate = self
    }
    
    private func setupTitle() {
        let title = "Home"
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

