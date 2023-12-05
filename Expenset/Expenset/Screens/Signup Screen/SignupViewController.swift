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

        // Do any additional setup after loading the view.
        self.title = "Sign up"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        signupView.buttonNext.addTarget(self, action: #selector(buttonNextTapped), for: .touchUpInside)
        signupView.buttonTakePhoto.menu = getMenuImagePicker()
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
    
    @objc func buttonNextTapped() {
        // First, validate all the input fields are not empty.
        guard let name = signupView.textFieldName.text, !name.isEmpty,
              let email = signupView.textFieldEmail.text, !email.isEmpty,
              let password = signupView.textFieldPassword.text, !password.isEmpty else {
            presentAlertWithTitle("Input Error", message: "Please fill in all fields.")
            return
        }
        
        if !isValidEmail(email) {
            presentAlertWithTitle("Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        let repeatPassword = signupView.textFieldRepeatPassword.text
        
        if password != repeatPassword {
            presentAlertWithTitle("Password not the same", message: "Please check your password again.")
            return
        }
        
        uploadProfilePhotoToStorageIfNeeded()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func presentAlertWithTitle(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}