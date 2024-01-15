//
//  HomeViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var transactions: [Transaction] = []
    
    let db = Firestore.firestore()
    
    var detailListener: ListenerRegistration?
    var balanceListener: ListenerRegistration?
    var transactionsListener: ListenerRegistration?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.getExpenseAndIncomeByDayInWeek()
        self.getTransactionByType(filterType: .expense)
        self.getBalanceinOneMonth()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        balanceListener?.remove()
        transactionsListener?.remove()
        detailListener?.remove()
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTimeRangeControlHandler()
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
    
    private func setupTimeRangeControlHandler() {

        let actions: [UIAction] = [
            UIAction(title: "Expense", handler: { _ in 

                self.getTransactionByType(filterType: .expense) }),
            UIAction(title: "Income", handler: { _ in 

                self.getTransactionByType(filterType: .income) })
            // Add more UIActions here if needed
        ]
        
        for (index, action) in actions.enumerated() {
            homeView.timeRangeControl.insertSegment(withTitle: action.title, at: index, animated: false)
            homeView.timeRangeControl.setAction(action, forSegmentAt: index)
        }
        
        homeView.timeRangeControl.selectedSegmentIndex = 0
    }
}

