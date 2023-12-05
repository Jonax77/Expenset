//
//  ViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 11/20/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        let homeTabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house")?.withTintColor(UIColor.secondaryLabel, renderingMode: .alwaysOriginal),
            selectedImage: UIImage(systemName: "house.fill")
        )
        homeTab.tabBarItem = homeTabBarItem
//        homeTab.title = "Home"
        
        let transactionTab = UINavigationController(rootViewController: TransactionViewController())
        let transactionTabBarItem = UITabBarItem(title: "Transaction", image: UIImage(systemName: "arrow.left.and.right.circle")?.withTintColor(UIColor.secondaryLabel, renderingMode: .alwaysOriginal), selectedImage: UIImage(systemName: "arrow.left.and.right.circle.fill"))
        
        
        transactionTab.tabBarItem = transactionTabBarItem
//        transactionTab.title = "Transaction"
        
        let chartTab = UINavigationController(rootViewController: ReportViewController())
        let chartTabBarItem = UITabBarItem(
            title: "Report",
            image: UIImage(systemName: "chart.pie")?.withTintColor(UIColor.secondaryLabel, renderingMode: .alwaysOriginal),
            selectedImage: UIImage(systemName: "chart.pie.fill"))
        
        chartTab.tabBarItem = chartTabBarItem
//        chartTab.title = "Report"
        
        let profileTab = UINavigationController(rootViewController: ProfileViewController())
        let profileTabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.crop.circle")?.withTintColor(UIColor.secondaryLabel, renderingMode: .alwaysOriginal),
            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        profileTab.tabBarItem = profileTabBarItem
//        profileTab.title = "Profile"
        
        let createTab = UINavigationController(rootViewController: CreateViewController())
        let createTabBarItem = UITabBarItem(
            title: "Create",
            image: UIImage(systemName: "plus.app")?.withTintColor(UIColor.secondaryLabel, renderingMode: .alwaysOriginal),
            selectedImage: UIImage(systemName: "plus.app.fill"))
        
        createTab.tabBarItem = createTabBarItem
//        createTab.title = "Create"

        
        //MARK: setting up this view controller as the Tab Bar Controller...
        let viewControllers = [homeTab, transactionTab, createTab, chartTab, profileTab]
        
        self.viewControllers = viewControllers
        
        //MARK: custom font
//        if let customFont = UIFont(name: "YourCustomFont", size: 16) {
//            let attributes: [NSAttributedString.Key: Any] = [
//                NSAttributedString.Key.font: customFont,
//                NSAttributedString.Key.foregroundColor: UIColor.black // You can set the color as desired
//            ]
//            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
//        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        // Do any additional setup after loading the view.
//        let createTab = UINavigationController(rootViewController: LoginViewController())
//
//        let createTabBarItem = UITabBarItem(
//            title: "Create",
//            image: UIImage(systemName: "plus.app")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(systemName: "plus.app.fill"))
//
//        self.viewControllers = [createTab]
//
//        self.tabBar.isHidden = true
//        self.tabBar.isUserInteractionEnabled = false
    }


}

