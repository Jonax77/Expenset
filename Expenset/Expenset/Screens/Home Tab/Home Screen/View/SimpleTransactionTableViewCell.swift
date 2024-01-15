//
//  SimpleTransactionTableViewCell.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/17/23.
//

import UIKit

class SimpleTransactionTableViewCell: UITableViewCell {
    
    var wrapperView: UIView!
    var categoryLabel: UILabel!
    var amountLabel: UILabel!
    var signLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupWrapperView()
        setupCategoryLabel()
        setupAmountLabel()
        setupSignLabel()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            wrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            categoryLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 16),
            categoryLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            
            amountLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -16),
            amountLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            
            signLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -8),
            signLabel.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            
            categoryLabel.trailingAnchor.constraint(lessThanOrEqualTo: signLabel.leadingAnchor, constant: -16),
            
        ])
    }
    
    
    func configure(transaction: Transaction) {
        categoryLabel.text = transaction.categoryName
        amountLabel.text = String(transaction.amount)
        signLabel.text = transaction.categoryType == .income ? "+" : "-"
    }
    
    func setupSignLabel() {
        signLabel = UILabel()
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        signLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        signLabel.textColor = UIColor.label
        signLabel.numberOfLines = 1
        wrapperView.addSubview(signLabel)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        categoryLabel.textColor = UIColor.label
        categoryLabel.numberOfLines = 1
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(categoryLabel)
    }
    
    func setupWrapperView() {
        wrapperView = UIView()
        wrapperView.backgroundColor = UIColor.secondarySystemBackground
        wrapperView.layer.cornerRadius = 12 // Set your desired corner radius
        wrapperView.clipsToBounds = true
        wrapperView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(wrapperView)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        amountLabel.textColor = UIColor.label
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.numberOfLines = 1
        wrapperView.addSubview(amountLabel)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

#Preview {
    HomeViewController()
}
