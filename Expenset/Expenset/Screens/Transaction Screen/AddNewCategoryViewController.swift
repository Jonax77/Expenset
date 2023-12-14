//
//  AddNewCategoryViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/5/23.
//

import UIKit

class AddNewCategoryViewController: UIViewController {
    
    let addNewCategoryView = AddNewCategoryView()
    var selectedType: String?
    
    override func loadView() {
        view = addNewCategoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        

        addNewCategoryView.incomeButton.addTarget(self, action: #selector(typeButtonSelected(_:)), for: .touchUpInside)
        addNewCategoryView.expenseButton.addTarget(self, action: #selector(typeButtonSelected(_:)), for: .touchUpInside)
    }
    
    
    @objc private func typeButtonSelected(_ sender: UIButton) {
        if sender == addNewCategoryView.incomeButton {
            addNewCategoryView.incomeButton.isSelected = true
            addNewCategoryView.underlineViewIncome.showUnderline()
            addNewCategoryView.expenseButton.isSelected = false
            addNewCategoryView.underlineViewExpense.hideUnderline()
            selectedType = addNewCategoryView.incomeButton.currentTitle
        } else if sender == addNewCategoryView.expenseButton {
            addNewCategoryView.incomeButton.isSelected = false
            addNewCategoryView.underlineViewIncome.hideUnderline()
            addNewCategoryView.expenseButton.isSelected = true
            addNewCategoryView.underlineViewExpense.showUnderline()
            selectedType = addNewCategoryView.expenseButton.currentTitle
        }
    }
}
