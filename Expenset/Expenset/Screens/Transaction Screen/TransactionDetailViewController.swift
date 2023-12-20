//
//  TransactionDetailViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/7/23.
//

import UIKit

class TransactionDetailViewController: UIViewController {
    
    let detailView = TransactionDetailView()
    var transaction: Transaction!
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupBarItem()
        detailView.configure(transaction: transaction)
        
    }
    
    private func setupBarItem() {
        let actions: [UIAction] = [.init(title: "Edit", handler: { _ in
            
        }),
                                   .init(title: "Delete", handler: { _ in
                                       
                                   })
        ]
        let menu = UIMenu(children: actions)
        menu.preferredElementSize = .small
        let barIcon = UIBarButtonItem(title: "", image: UIImage(systemName: "ellipsis")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), menu: menu)
        navigationItem.rightBarButtonItems = [barIcon]

    }
    
    private func setupTitle() {
        let title = "Transaction Detail"
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
