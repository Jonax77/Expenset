//
//  TransactionViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TransactionViewController: UIViewController {
    
    let db = Firestore.firestore()
    var searchTimer: Timer?
    
    var categories: [Category] = []
    var transactions: [Transaction] = []
    
    var categoryListener: ListenerRegistration?
    var transactionListener: ListenerRegistration?
    
    var timeRangeMenuItems: [UIAction]!
    var timeRangeMenu: UIMenu!
    
    var categoryMenuItems: [UIAction]!
    var categoryMenu: UIMenu!
    
    let transactionView = TransactionView()
    let childProgressView = LoadingViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getTransactionByTimeRange(filterTimeRange: .allTime)
        self.getAllCategories()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        categoryListener?.remove()
        transactionListener?.remove()
    }
    
    override func loadView() {
        view = transactionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()

        self.transactionView.addNewCategoryButton.addTarget(self, action: #selector(addNewCategoryButtonTapped), for: .touchUpInside)
        
        self.transactionView.transactionTableView.dataSource = self
        self.transactionView.transactionTableView.delegate = self
        self.transactionView.transactionTableView.reloadData()
        
        self.transactionView.searchBar.delegate = self

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
        setupTimeRangeMenu()
        setupCategoryMenu()
    }

}

