//
//  EditTransactionViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/8/24.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import PhotosUI

class EditTransactionViewController: UIViewController {
    
    let editView = EnterTransactionDetailView()
    let childProgressView = LoadingViewController()
    
    var categories: [Category] = []
    var originalTransaction: Transaction!
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    var listener: ListenerRegistration?
    
    var selectedCategory: Category?
    var selectedDate: Date?
    var pickedImage: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addCategoryListener()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.removeCategoryListener()
    }
    
    override func loadView() {
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        configure(transaction: originalTransaction)
        
        editView.categoryPicker.delegate = self
        editView.categoryPicker.dataSource = self
        editView.addPhotoButton.menu = getMenuImagePicker()
        editView.addPhotoButton.showsMenuAsPrimaryAction = true
        
        editView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
        editView.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        

        
        selectedDate = Date()
    }
    
    @objc private func onSubmitButtonTapped() {
        validateInput()
        uploadPhotoToStorageIfNeeded()
        
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        // You can perform additional actions here with the updated selectedDate value
    }
    
    func validateInput() {
        if let description = editView.descriptionTextView.text,
            let amount = editView.amountField.text,
           let category = selectedCategory,
           let date = selectedDate,
            description.isEmpty || amount.isEmpty  {
            presentAlertWithTitle("Invalid Input", message: "Please fill in all blanks.")
            return
            
        }
        
        
    }
    
    func clearInput() {
        editView.amountField.text = ""
        editView.descriptionTextView.text = ""
        if !categories.isEmpty {
            editView.categoryPicker.selectRow(0, inComponent: 0, animated: true)
            selectedCategory = categories[0]
        }
        editView.datePicker.date = Date()
        editView.addPhotoButton.setImage(UIImage(systemName: "plus.square.dashed")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), for: .normal)
        pickedImage = nil
    }
    
    func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
        
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    func configure(transaction: Transaction) {
        editView.amountField.text = String(transaction.amount)
        editView.descriptionTextView.text = String(transaction.description)
        editView.datePicker.date = transaction.timestamp.dateValue()
        
        if let link = transaction.image {
            editView.addPhotoButton.loadRemoteImage(from: link)
        }
        
        
        if let index = categories.firstIndex(where: { $0.name == transaction.categoryName }) {
            editView.categoryPicker.selectRow(index, inComponent: 0, animated: true)
        }
        
    }
    
    private func setupTitle() {
        let title = "Edit Transaction Detail"
        let attributedString = NSMutableAttributedString(string: title)
        
        // Apply attributes to the attributed string
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label, // Change text color
            .font: UIFont(name: Comfortaa.Bold, size: 16)// Change font and size
            // Add more attributes if needed
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: title.count))
        
        // Create a label with the attributed string
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedString
        titleLabel.sizeToFit() // Adjust the label size to fit the attributed text
        
        // Set the label as the title view of the navigation item
        navigationItem.titleView = titleLabel
    }

}
