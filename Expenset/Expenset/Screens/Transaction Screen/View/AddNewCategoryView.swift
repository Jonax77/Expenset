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

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            nameField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            
            typeLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 32),
            typeLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            
            incomeButton.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 24),
            incomeButton.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            
            nextButton.topAnchor.constraint(equalTo: incomeButton.bottomAnchor, constant: 32),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
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
    
    func setupIncomeButton() {
        incomeButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 16) as Any,
            .foregroundColor: UIColor.label
        ]
        let attributedString = NSAttributedString(string: "Income", attributes: attributes)
        incomeButton.setAttributedTitle(attributedString, for: .normal)
        incomeButton.translatesAutoresizingMaskIntoConstraints = false
        incomeButton.layer.borderWidth = 1.0
        incomeButton.layer.cornerRadius = 8
        incomeButton.layer.backgroundColor = UIColor.label.cgColor
        self.addSubview(incomeButton)
    }
    
    func setupExpenseButton() {
        
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.font = UIFont(name: Comfortaa.Regular, size: 16)
        nameField.textColor = UIColor.label
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }

}
