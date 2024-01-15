//
//  ProfileDetailViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/16/23.
//

import UIKit
import FirebaseAuth

class ProfileDetailViewController: UIViewController {
    
    let detailView = ProfileDetailView()
    let childProgressView = LoadingViewController()
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupBarItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCurrentUser()
    }
    
    private func setupTitle() {
        let title = "Profile Detail"
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
    
    private func setupBarItem() {
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "square.and.pencil")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(onEditButtonTapped)
        )
        navigationItem.rightBarButtonItems = [barIcon]
    }
    
    @objc private func onEditButtonTapped() {
        let vc = EditProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
