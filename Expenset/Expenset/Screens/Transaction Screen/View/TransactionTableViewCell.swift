//
//  TransactionTableViewCell.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/5/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    var wrapperCell: UIView!
    var categoryLabel: UILabel!
    var descriptionLabel: UILabel!
    var amountLabel: UILabel!
    var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
        setupConstraint()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        setupWrapperCell()
        setupCategoryLabel()
        setupDescriptionLabel()
        setupAmountLabel()
        setupDateLabel()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            wrapperCell.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCell.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: wrapperCell.topAnchor, constant: 16),
            categoryLabel.leadingAnchor.constraint(equalTo: wrapperCell.leadingAnchor, constant: 16),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: wrapperCell.bottomAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: wrapperCell.leadingAnchor, constant: 16),
            
            amountLabel.topAnchor.constraint(equalTo: wrapperCell.topAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: wrapperCell.trailingAnchor, constant: -16),
            
            dateLabel.bottomAnchor.constraint(equalTo: wrapperCell.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: wrapperCell.trailingAnchor, constant: -16)
            
        ])
    }
    
    func configure(transaction: Transaction) {
        categoryLabel.text = transaction.category.name
        descriptionLabel.text = transaction.description
        amountLabel.text = String(transaction.amount)
        dateLabel.text = transaction.createdTime.getStringFromDate()
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = UIFont(name: Comfortaa.Light, size: 16)
        dateLabel.textColor = UIColor.tertiaryLabel
        dateLabel.numberOfLines = 1
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateLabel)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        amountLabel.textColor = UIColor.label
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.numberOfLines = 1
        self.addSubview(amountLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: Comfortaa.Regular, size: 16)
        descriptionLabel.textColor = UIColor.secondaryLabel
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 1
        self.addSubview(descriptionLabel)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        categoryLabel.textColor = UIColor.label
        descriptionLabel.numberOfLines = 1
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryLabel)
    }
    
    func setupWrapperCell() {
        wrapperCell = UITableViewCell()
        wrapperCell.backgroundColor = UIColor.secondarySystemBackground
        wrapperCell.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCell)
    }

}
