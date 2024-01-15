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
    var imageLabel: UILabel!
    var imageView: UIImageView!

    var wrapperView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemBackground
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(transaction: Transaction) {
        categoryLabel.text = transaction.categoryName
        amountLabel.text = String(transaction.amount)
        descriptionLabel.text = transaction.description
        dateLabel.text = transaction.timestamp.dateValue().getStringFromDate()
        
        if let link = transaction.image {

            imageView.loadRemoteImage(from: link)
        }
        
    }
    
    func setupView() {
        setupWrapperView()
        setupAmountTitleLabel()
        setupAmountLabel()
        setupCategoryTitleLabel()
        setupCategoryLabel()
        setupDescriptionTitleLabel()
        setupDescriptionLabel()
        setupDateTitleLabel()
        setupDateLabel()
        setupImageLabel()
        setupImageView()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            wrapperView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            wrapperView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            amountTitleLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 32),
            amountTitleLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            amountLabel.topAnchor.constraint(equalTo: amountTitleLabel.bottomAnchor, constant: 16),
            amountLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            categoryTitleLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 32),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: 16),
            categoryLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            dateTitleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 32),
            dateTitleLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 32),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -32),
            
            imageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            imageLabel.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            
            imageView.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: amountTitleLabel.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
    
    func setupWrapperView() {
        wrapperView = UIScrollView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperView)
    }
    
    func setupImageLabel() {
        imageLabel = UILabel()
        imageLabel.text = "Photo"
        imageLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        imageLabel.textColor = UIColor.label
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(imageLabel)
    }
    
    func setupImageView() {
        imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.on.rectangle.angled")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(imageView)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: Comfortaa.Regular, size: 18)
        categoryLabel.textColor = UIColor.label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(categoryLabel)
    }
    
    func setupCategoryTitleLabel() {
        categoryTitleLabel = UILabel()
        categoryTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        categoryTitleLabel.text = "Category"
        categoryTitleLabel.textColor = UIColor.label
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(categoryTitleLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: Comfortaa.Regular, size: 18)
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(descriptionLabel)
    }
    
    func setupDescriptionTitleLabel() {
        descriptionTitleLabel = UILabel()
        descriptionTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.textColor = UIColor.label
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(descriptionTitleLabel)
    }
    
    func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.font = UIFont(name: Comfortaa.Regular, size: 18)
        amountLabel.textColor = UIColor.label
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(amountLabel)
    }
    
    func setupAmountTitleLabel() {
        amountTitleLabel = UILabel()
        amountTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        amountTitleLabel.text = "Amount"
        amountTitleLabel.textColor = UIColor.label
        amountTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(amountTitleLabel)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = UIFont(name: Comfortaa.Regular, size: 18)
        dateLabel.textColor = UIColor.label
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(dateLabel)
    }
    
    func setupDateTitleLabel() {
        dateTitleLabel = UILabel()
        dateTitleLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        dateTitleLabel.text = "Created Time"
        dateTitleLabel.textColor = UIColor.label
        dateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(dateTitleLabel)
    }

}
