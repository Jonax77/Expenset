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
    
    let transactionView = TransactionView()
    
    override func loadView() {
        view = transactionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Transaction"
        
        setupMenu()
        
        self.transactionView.addNewCategoryButton.addTarget(self, action: #selector(addNewCategoryButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addNewCategoryButtonTapped() {
        let vc = AddNewCategoryViewController()
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        present(vc, animated: true)
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

