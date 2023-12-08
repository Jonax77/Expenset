//
//  TransactionDetailView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/6/23.
//

import UIKit

class TransactionDetailView: UIView {
    
    var categoryLabel: UILabel!
    var categoryTitleLabel: UILabel!
    var descriptionLabel: UILabel!
    var descriptionTitleLabel: UILabel!
    var amountLabel: UILabel!
    var amountTitleLabel: UILabel!
    var dateTitleLabel: UILabel!
    var dateLabel: UILabel!
    var imageView: UIImageView!
    var stackView: UIStackView!
    var wrapperView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(transaction: Transaction) {
        
    }
    
    
    func setupView() {
        setupStackView()
        setupAmountTitleLabel()
        setupAmountLabel()
        setupCategoryTitleLabel()
        setupCategoryLabel()
        setupDescriptionTitleLabel()
        setupDescriptionLabel()
        setupDateTitleLabel()
        setupDateLabel()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            wrapperView.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            wrapperView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo:wrapperView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo:wrapperView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -16),
            
            imageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
    
    func setupImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
    }
    
    func setupStackView() {
        stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        self.addSubview(stackView)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: Comfortaa.Regular, size: 24)
        categoryLabel.textColor = UIColor.label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(categoryLabel)
    }
    
    func setupCategoryTitleLabel() {
        categoryTitleLabel = UILabel()
        categoryTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 32)
        categoryTitleLabel.text = "Category"
        categoryTitleLabel.textColor = UIColor.secondaryLabel
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(categoryTitleLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: Comfortaa.Regular, size: 24)
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupDescriptionTitleLabel() {
        descriptionTitleLabel = UILabel()
        descriptionTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 32)
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.textColor = UIColor.secondaryLabel
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(descriptionTitleLabel)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.font = UIFont(name: Comfortaa.Regular, size: 24)
        amountLabel.textColor = UIColor.label
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(amountLabel)
    }
    
    func setupAmountTitleLabel() {
        amountTitleLabel = UILabel()
        amountTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 32)
        amountTitleLabel.text = "Amount"
        amountTitleLabel.textColor = UIColor.secondaryLabel
        amountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(amountTitleLabel)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = UIFont(name: Comfortaa.Regular, size: 24)
        dateLabel.textColor = UIColor.label
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(dateLabel)
    }
    
    func setupDateTitleLabel() {
        dateTitleLabel = UILabel()
        dateTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 32)
        dateTitleLabel.text = "Create Time"
        dateTitleLabel.textColor = UIColor.secondaryLabel
        dateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(dateTitleLabel)
    }

}
