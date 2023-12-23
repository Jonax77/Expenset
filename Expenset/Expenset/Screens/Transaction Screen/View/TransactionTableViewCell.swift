//
//  TransactionTableViewCell.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/5/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    var containerView: UIView!
    var categoryLabel: UILabel!
    var descriptionLabel: UILabel!
    var amountLabel: UILabel!
    var dateLabel: UILabel!
    var signLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraint()
    }
    
    func setupView() {
        
        setupContainerView()
        setupCategoryLabel()
        setupDescriptionLabel()
        setupAmountLabel()
        setupDateLabel()
        setupSignLabel()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            categoryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),

            
            amountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            signLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -8),
            signLabel.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            categoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: signLabel.leadingAnchor, constant: -16),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: dateLabel.leadingAnchor, constant: -32),
            
            containerView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16)
        ])
    }
    
    func configure(transaction: Transaction) {
        categoryLabel.text = transaction.category.name
        descriptionLabel.text = transaction.description
        amountLabel.text = String(transaction.amount)
        dateLabel.text = transaction.timestamp.getStringFromDate()
        signLabel.text = transaction.category.type == .income ? "+" : "-"
    }
    
    func setupSignLabel() {
        signLabel = UILabel()
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        signLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        signLabel.textColor = UIColor.label
        signLabel.numberOfLines = 1
        containerView.addSubview(signLabel)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = UIFont(name: Comfortaa.Light, size: 16)
        dateLabel.textColor = UIColor.label
        dateLabel.numberOfLines = 1
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateLabel)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        amountLabel.textColor = UIColor.label
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.numberOfLines = 1
        containerView.addSubview(amountLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: Comfortaa.Regular, size: 16)
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 1
        containerView.addSubview(descriptionLabel)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        categoryLabel.textColor = UIColor.label
        categoryLabel.numberOfLines = 1
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(categoryLabel)
    }
    
    func setupContainerView() {
        containerView = UIView()
        containerView.backgroundColor = UIColor.secondarySystemBackground
        containerView.layer.cornerRadius = 12 // Set your desired corner radius
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(containerView)
    }

}

#Preview {
    TransactionViewController()
}
