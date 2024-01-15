//
//  SignupViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseStorage

class SignupViewController: UIViewController {
    
    let signupView = SignupView()
    let childProgressView = LoadingViewController()
    var pickedImage: UIImage?
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    override func loadView() {
        view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        
        signupView.buttonNext.addTarget(self, action: #selector(buttonNextTapped), for: .touchUpInside)
        signupView.buttonTakePhoto.menu = getMenuImagePicker()
        
        
    }
    
    private func setupTitle() {
        let title = "Sign up"
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
        
        
        let navigationBarAppearance = UINavigationBar.appearance()
        let navigationTitleTextAttributes : [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label, // Change text color
            .font: UIFont(name: Comfortaa.Bold, size: 16)// Change font and size
            // Add more attributes if needed
        ]

        // Apply the attributes to the navigation bar
        navigationBarAppearance.titleTextAttributes = navigationTitleTextAttributes

    }
    
    @objc func buttonNextTapped() {
        
        validateInput()
        uploadProfilePhotoToStorageIfNeeded()
    }
    
   
}

#Preview {
    SignupViewController()
}
