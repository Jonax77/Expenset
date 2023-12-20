//
//  TransactionView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class TransactionView: UIView {
    
    var searchBar: UISearchBar!
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
        setupSearchBar()
        setupTimeRangeMenuButton()
        setupCategoryMenuButton()
        setupAddNewCategoryButton()
        setupTableView()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            timeRangeMenuButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24),
            timeRangeMenuButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            categoryMenuButton.topAnchor.constraint(equalTo: timeRangeMenuButton.topAnchor),
            categoryMenuButton.leadingAnchor.constraint(equalTo: timeRangeMenuButton.trailingAnchor, constant: 16),
            
            addNewCategoryButton.topAnchor.constraint(equalTo: timeRangeMenuButton.topAnchor),
            addNewCategoryButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            addNewCategoryButton.heightAnchor.constraint(equalToConstant: 32),
            addNewCategoryButton.widthAnchor.constraint(equalToConstant: 32),
            
            transactionTableView.topAnchor.constraint(equalTo: timeRangeMenuButton.bottomAnchor, constant: 32),
            transactionTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            transactionTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            transactionTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.backgroundColor = .clear
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.layer.cornerRadius = 8
        searchBar.searchTextField.font = UIFont(name: Comfortaa.Regular, size: 18)
        searchBar.placeholder = "Search description..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchBar)
    }
    
    func setupTableView() {
        transactionTableView = UITableView()
        transactionTableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: Config.transactionTableCellID)
        transactionTableView.separatorStyle = .none
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

#Preview {
    TransactionViewController()
}
