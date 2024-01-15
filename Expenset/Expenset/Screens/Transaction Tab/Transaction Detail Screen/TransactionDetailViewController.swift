//
//  TransactionDetailViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/7/23.
//

import UIKit
import FirebaseFirestore

class TransactionDetailViewController: UIViewController {
    
    let detailView = TransactionDetailView()
    let childProgressView = LoadingViewController()
    var transaction: Transaction!
    
    let db = Firestore.firestore()
    
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
            let vc = EditTransactionViewController()
            vc.originalTransaction = self.transaction
            self.navigationController?.pushViewController(vc, animated: true)
        }),
           .init(title: "Delete", handler: { _ in
               let deleteAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete this transaction?", preferredStyle: .actionSheet)
               
               deleteAlert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                   self.deleteTransaction()
               }))
               
               deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
               
               self.present(deleteAlert, animated: true)
               
           })
        ]
        

        let menu = UIMenu(children: actions)
        menu.preferredElementSize = .small
        let barIcon = UIBarButtonItem(title: "", image: UIImage(systemName: "ellipsis")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), menu: menu)
        navigationItem.rightBarButtonItems = [barIcon]

    }
    
    func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
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
