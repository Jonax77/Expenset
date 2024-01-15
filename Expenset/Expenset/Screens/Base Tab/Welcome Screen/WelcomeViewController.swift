//
//  WelcomeViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/23/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    
    override func loadView() {
        view = welcomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeView.nextButton.addTarget(self, action: #selector(onNextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func onNextButtonTapped() {
        let vc = LoginViewController()
        navigationController?.setViewControllers([vc], animated: true)
    }
}
