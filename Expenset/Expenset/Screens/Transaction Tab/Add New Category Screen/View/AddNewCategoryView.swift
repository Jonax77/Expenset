//
//  AddNewCategoryView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/5/23.
//

import UIKit

class AddNewCategoryView: UIView {
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var nameField: UITextField!
    var incomeButton: UIButton!
    var expenseButton: UIButton!
    var typeLabel: UILabel!
    var nextButton: UIButton!
    
    var underlineViewIncome: UnderlineView!
    var underlineViewExpense: UnderlineView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemBackground
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupTitleLabel()
        setupNameLabel()
        setupNameField()
        setupTypeLabel()
        setupIncomeButton()
        setupExpenseButton()
        setupNextButton()
        setupUnderlineViewIncome()
        setupUnderlineViewExpense()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            nameField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            typeLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 32),
            typeLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            
            incomeButton.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 32),
            incomeButton.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            
            underlineViewIncome.leadingAnchor.constraint(equalTo: incomeButton.leadingAnchor),
            underlineViewIncome.trailingAnchor.constraint(equalTo: incomeButton.trailingAnchor),
            underlineViewIncome.bottomAnchor.constraint(equalTo: incomeButton.bottomAnchor),
            underlineViewIncome.heightAnchor.constraint(equalToConstant: 2),
            
            expenseButton.leadingAnchor.constraint(equalTo: incomeButton.trailingAnchor, constant: 32),
            expenseButton.centerYAnchor.constraint(equalTo: incomeButton.centerYAnchor),
            
            underlineViewExpense.leadingAnchor.constraint(equalTo: expenseButton.leadingAnchor),
            underlineViewExpense.trailingAnchor.constraint(equalTo: expenseButton.trailingAnchor),
            underlineViewExpense.bottomAnchor.constraint(equalTo: expenseButton.bottomAnchor),
            underlineViewExpense.heightAnchor.constraint(equalToConstant: 2),
            
            nextButton.topAnchor.constraint(equalTo: incomeButton.bottomAnchor, constant: 32),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
        ])
    }
    
    func setupNextButton() {
        nextButton = UIButton(type: .system)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 24) as Any,
            .foregroundColor: UIColor.systemBackground
        ]
        let attributedString = NSAttributedString(string: "Next", attributes: attributes)
        nextButton.setAttributedTitle(attributedString, for: .normal)
        
        nextButton.backgroundColor = UIColor.label
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.layer.shadowColor = UIColor.label.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        nextButton.layer.shadowRadius = 4
        nextButton.layer.shadowOpacity = 0.25
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nextButton)
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Add New Category"
        titleLabel.font = UIFont(name: Comfortaa.Bold, size: 34)
        titleLabel.textColor = UIColor.label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    func setupTypeLabel() {
        typeLabel = UILabel()
        typeLabel.text = "Type:"
        typeLabel.font = UIFont(name: Comfortaa.Bold, size: 20)
        typeLabel.textColor = UIColor.label
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typeLabel)
    }
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.font = UIFont(name: Comfortaa.Bold, size: 20)
        nameLabel.textColor = UIColor.label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
    
    func setupUnderlineViewIncome() {
        underlineViewIncome = UnderlineView()
        underlineViewIncome.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(underlineViewIncome)
    }
    
    func setupUnderlineViewExpense() {
        underlineViewExpense = UnderlineView()
        underlineViewExpense.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(underlineViewExpense)
    }
    
    func setupIncomeButton() {
        incomeButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 16) as Any,
            .foregroundColor: UIColor.label
        ]
        let attributedString = NSAttributedString(string: "Income", attributes: attributes)
        incomeButton.setAttributedTitle(attributedString, for: .normal)
        incomeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(incomeButton)
    }
    
    func setupExpenseButton() {
        expenseButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 16) as Any,
            .foregroundColor: UIColor.label
        ]
        let attributedString = NSAttributedString(string: "Expense", attributes: attributes)
        expenseButton.setAttributedTitle(attributedString, for: .normal)
        expenseButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(expenseButton)
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.textColor = UIColor.label
        nameField.font = UIFont(name: Comfortaa.Regular, size: 18)
        nameField.layer.cornerRadius = 8.0
        nameField.layer.borderWidth = 1.0
        nameField.layer.borderColor = UIColor.label.cgColor
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }

}
