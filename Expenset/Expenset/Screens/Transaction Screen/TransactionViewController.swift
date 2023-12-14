//
//  TransactionViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class TransactionViewController: UIViewController {
    
    var timeRangeMenuItems: [UIAction]!
    var timeRangeMenu: UIMenu!
    
    var categoryMenuItems: [UIAction]!
    var categoryMenu: UIMenu!
    
    
    var transactionData: [Transaction] = [Transaction(amount: 15, category: Category(name: "Grocery", type: .expense), createdTime: Date())]
    
    let transactionView = TransactionView()
    
    override func loadView() {
        view = transactionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupMenu()
        
        self.transactionView.addNewCategoryButton.addTarget(self, action: #selector(addNewCategoryButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addNewCategoryButtonTapped() {
        let vc = AddNewCategoryViewController()
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        present(vc, animated: true)
    }
    
    private func setupTitle() {
        let title = "Transaction"
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
    
    func setupMenu() {
        timeRangeMenuItems = [
            UIAction(title: "Today", handler: { (_) in
        }),
            UIAction(title: "Week", handler: { (_) in
        }),
            UIAction(title: "Month", handler: { (_) in
        }),
            UIAction(title: "Year", handler: { (_) in
        }),
            UIAction(title: "All", handler: { (_) in
        }),
        ]
        
        timeRangeMenu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: timeRangeMenuItems)
        timeRangeMenu.preferredElementSize = .large
        
        self.transactionView.timeRangeMenuButton.menu = timeRangeMenu
        self.transactionView.timeRangeMenuButton.showsMenuAsPrimaryAction = true
        
        categoryMenuItems = [
            UIAction(title: "Today", handler: { (_) in
        }),
            UIAction(title: "Week", handler: { (_) in
        }),
            UIAction(title: "Month", handler: { (_) in
        }),
            UIAction(title: "Year", handler: { (_) in
        }),
            UIAction(title: "All", handler: { (_) in
        }),
        ]
    
        categoryMenu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: categoryMenuItems)
        categoryMenu.preferredElementSize = .large
        
        self.transactionView.categoryMenuButton.menu = categoryMenu
        self.transactionView.categoryMenuButton.showsMenuAsPrimaryAction = true
    }

}

