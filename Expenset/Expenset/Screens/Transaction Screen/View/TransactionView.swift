//
//  TransactionView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class TransactionView: UIView {
    
    var timeRangeMenuButton: UIButton!
    var categoryMenuButton: UIButton!
    var addNewCategoryButton: UIButton!
    
    var transactionTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupTimeRangeMenuButton()
        setupCategoryMenuButton()
        setupAddNewCategoryButton()
        setupTableView()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            timeRangeMenuButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            timeRangeMenuButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            categoryMenuButton.topAnchor.constraint(equalTo: timeRangeMenuButton.topAnchor),
            categoryMenuButton.leadingAnchor.constraint(equalTo: timeRangeMenuButton.trailingAnchor, constant: 16),
            
            addNewCategoryButton.topAnchor.constraint(equalTo: timeRangeMenuButton.topAnchor),
            addNewCategoryButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addNewCategoryButton.heightAnchor.constraint(equalToConstant: 24),
            addNewCategoryButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setupTableView() {
        transactionTableView = UITableView()
        transactionTableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: Config.transactionTableCellID)
        transactionTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(transactionTableView)
    }
    
    func setupAddNewCategoryButton() {
        addNewCategoryButton = UIButton()
        addNewCategoryButton.setImage(UIImage(systemName: "plus")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), for: .normal)
        addNewCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addNewCategoryButton)
    }
    
    func setupTimeRangeMenuButton() {
        timeRangeMenuButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 16) as Any,
            .foregroundColor: UIColor.label
        ]
        let attributedString = NSAttributedString(string: "Time Range ⌄", attributes: attributes)
        timeRangeMenuButton.setAttributedTitle(attributedString, for: .normal)
        timeRangeMenuButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeRangeMenuButton)
    }
    
    func setupCategoryMenuButton() {
        categoryMenuButton = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 16) as Any,
            .foregroundColor: UIColor.label
        ]
        let attributedString = NSAttributedString(string: "Category ⌄", attributes: attributes)
        categoryMenuButton.setAttributedTitle(attributedString, for: .normal)
        categoryMenuButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryMenuButton)
    }

}
