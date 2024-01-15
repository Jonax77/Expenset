//
//  AddNewCategoryViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/5/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddNewCategoryViewController: UIViewController {
    
    let addNewCategoryView = AddNewCategoryView()
    let childProgressView = LoadingViewController()
    var selectedType: Category.CategoryType = .income
    
    let db = Firestore.firestore()
    
    override func loadView() {
        view = addNewCategoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        
        addNewCategoryView.incomeButton.isSelected = true
        addNewCategoryView.underlineViewIncome.showUnderline()
        
        addNewCategoryView.incomeButton.addTarget(self, action: #selector(typeButtonSelected(_:)), for: .touchUpInside)
        addNewCategoryView.expenseButton.addTarget(self, action: #selector(typeButtonSelected(_:)), for: .touchUpInside)
        addNewCategoryView.nextButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func typeButtonSelected(_ sender: UIButton) {
        if sender == addNewCategoryView.incomeButton {
            addNewCategoryView.incomeButton.isSelected = true
            addNewCategoryView.underlineViewIncome.showUnderline()
            addNewCategoryView.expenseButton.isSelected = false
            addNewCategoryView.underlineViewExpense.hideUnderline()
            selectedType = .income
        } else if sender == addNewCategoryView.expenseButton {
            addNewCategoryView.incomeButton.isSelected = false
            addNewCategoryView.underlineViewIncome.hideUnderline()
            addNewCategoryView.expenseButton.isSelected = true
            addNewCategoryView.underlineViewExpense.showUnderline()
            selectedType = .expense
        }
    }
    
    @objc private func onSubmitButtonTapped() {
        validateInput()
        
        addNewCategory()
    }
    
    private func validateInput() {
        if let text = addNewCategoryView.nameField.text, text.isEmpty {
            self.presentAlertWithTitle("Error", message: "Please fill in the blanks.")
            return
        }
        
        addNewCategoryView.nameField.text = addNewCategoryView.nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        addNewCategoryView.nameField.text = addNewCategoryView.nameField.text?.capitalized
    }
    
    func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
