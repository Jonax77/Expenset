//
//  CreateView.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class CreateView: UIView {
    
    var wrapperView: UIScrollView!
    var titleLabel: UILabel!
    var amountField: UITextField!
    var dateLabel: UILabel!
    var datePicker: UIDatePicker!
    var categoryLabel: UILabel!
    var categoryPicker: UIPickerView!
    var descriptionLabel: UILabel!
    var descriptionTextView: UITextView!
    var addPhotoLabel: UILabel!
    var addPhotoButton: UIButton!
    var submitButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupWrapperView()
        setupTitleLabel()
        setupAmountField()
        setupCategoryLabel()
        setupCategoryPicker()
        setupDateLabel()
        setupDatePicker()
        setupDescriptionLabel()
        setupDescriptionField()
        setupAddPhotoLabel()
        setupAddPhotoButton()
        setupSubmitButton()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            wrapperView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            
            amountField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            amountField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            amountField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -32),
            amountField.heightAnchor.constraint(equalToConstant: 48),
            
            categoryLabel.topAnchor.constraint(equalTo: amountField.bottomAnchor, constant: 32),
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            categoryPicker.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            categoryPicker.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryPicker.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -32),
            categoryPicker.heightAnchor.constraint(equalToConstant: 80),
            
            dateLabel.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor, constant: 32),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            descriptionTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -32),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),
            
            addPhotoLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 32),
            addPhotoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            addPhotoButton.topAnchor.constraint(equalTo: addPhotoLabel.bottomAnchor, constant: 16),
            addPhotoButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 100),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 120),
            
            submitButton.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 32),
            submitButton.heightAnchor.constraint(equalToConstant: 48),
            submitButton.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -16),
            submitButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 32),
            submitButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -32),
        ])

    }
    
    func setupWrapperView() {
        wrapperView = UIScrollView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperView)
    }
    
    func setupAddPhotoLabel() {
        addPhotoLabel = UILabel()
        addPhotoLabel.text = "Add a photo (Optional)"
        addPhotoLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        addPhotoLabel.textColor = UIColor.label
        addPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(addPhotoLabel)
    }
    
    func setupSubmitButton() {
        submitButton = UIButton(type: .system)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: Comfortaa.Bold, size: 24) as Any,
            .foregroundColor: UIColor.systemBackground
        ]
        let attributedString = NSAttributedString(string: "Submit", attributes: attributes)
        submitButton.setAttributedTitle(attributedString, for: .normal)
        
        submitButton.backgroundColor = UIColor.label
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.layer.shadowColor = UIColor.label.cgColor
        submitButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        submitButton.layer.shadowRadius = 4
        submitButton.layer.shadowOpacity = 0.25
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(submitButton)

    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(descriptionLabel)
    }
    
    func setupDescriptionField() {
        descriptionTextView = UITextView()
        descriptionTextView.font = UIFont(name: Comfortaa.Bold, size: 16)
        descriptionTextView.textColor = UIColor.label
        descriptionTextView.isEditable = true
        descriptionTextView.isScrollEnabled = true
        descriptionTextView.layer.cornerRadius = 8.0
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.label.cgColor
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(descriptionTextView)
    }
    
    func setupAddPhotoButton() {
        addPhotoButton = UIButton()
        addPhotoButton.setImage(UIImage(systemName: "plus.square.dashed")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), for: .normal)
        addPhotoButton.contentMode = .scaleAspectFill
        addPhotoButton.contentHorizontalAlignment = .fill
        addPhotoButton.contentVerticalAlignment = .fill
        addPhotoButton.clipsToBounds = true
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(addPhotoButton)
    }
    
    func setupCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.text = "Category"
        categoryLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        categoryLabel.textColor = UIColor.label
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(categoryLabel)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.text = "Created Time"
        dateLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        dateLabel.textColor = UIColor.label
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(dateLabel)
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "How much?"
        titleLabel.textColor = UIColor.label
        titleLabel.font = UIFont(name: Comfortaa.Bold, size: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(titleLabel)
    }
    
    func setupAmountField() {
        amountField = UITextField()
        amountField.font = UIFont(name: Comfortaa.Bold, size: 24)
        amountField.textColor = UIColor.label
        amountField.layer.cornerRadius = 8.0
        amountField.layer.borderWidth = 1.0
        amountField.layer.borderColor = UIColor.label.cgColor
        amountField.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(amountField)
    }
    
    func setupCategoryPicker() {
        categoryPicker = UIPickerView()
        categoryPicker.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(categoryPicker)
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.date = Date()
        datePicker?.locale = .current
        datePicker?.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(datePicker)
    }

}

#Preview {
    CreateView()
}
