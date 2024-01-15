//
//  CreateViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class CreateViewController: UIViewController {
    
    let createView = EnterTransactionDetailView()
    let childProgressView = LoadingViewController()
    var categories: [Category] = []
    
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
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        
        createView.categoryPicker.delegate = self
        createView.categoryPicker.dataSource = self
        createView.addPhotoButton.menu = getMenuImagePicker()
        createView.addPhotoButton.showsMenuAsPrimaryAction = true
        
        createView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
        createView.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        

        
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
        if let description = createView.descriptionTextView.text,
            let amount = createView.amountField.text,
           let category = selectedCategory,
           let date = selectedDate,
            description.isEmpty || amount.isEmpty  {
            presentAlertWithTitle("Invalid Input", message: "Please fill in all blanks.")
            return
            
        }
        
        
    }
    
    func clearInput() {
        createView.amountField.text = ""
        createView.descriptionTextView.text = ""
        if !categories.isEmpty {
            createView.categoryPicker.selectRow(0, inComponent: 0, animated: true)
            selectedCategory = categories[0]
        }
        createView.datePicker.date = Date()
        createView.addPhotoButton.setImage(UIImage(systemName: "plus.square.dashed")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal), for: .normal)
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
    

    private func setupTitle() {
        let title = "Create"
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

}


