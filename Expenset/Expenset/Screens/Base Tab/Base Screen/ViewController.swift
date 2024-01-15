//
//  ViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 11/20/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let notificationCenter = NotificationCenter.default
    let defaults = UserDefaults.standard
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    
    let db = Firestore.firestore()
    
    let childProgressView = LoadingViewController()
    
    var listener: ListenerRegistration?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNoti()
        handleAuthStatus()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
        
        if listener != nil {
            listener?.remove()
        }
    }
    
    private func handleAuthStatus() {
        self.showActivityIndicator()
        
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                
                self.setupLoginView()
                
                self.hideActivityIndicator()
                
            }else{
                
                self.setupMainView()
                
                self.hideActivityIndicator()
            }
        }
    }
    
    private func setupNoti() {
//        notificationCenter.addObserver(
//                    self,
//                    selector: #selector(notificationReceivedForLoginStatus(notification:)),
//                    name: .AuthStateDidChange,
//                    object: nil)
    }
    
    private func storeUserInUserDefaults(user: User) {
        let userDefaults = UserDefaults.standard
        let userData = try? NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
        userDefaults.set(userData, forKey: "currentUser")
        userDefaults.synchronize()
    }

    private func getUserFromUserDefaults() -> User? {
        let userDefaults = UserDefaults.standard
        if let userData = userDefaults.object(forKey: "currentUser") as? Data {
            if let user = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userData) as? User {
                return user
            }
        }
        return nil
    }
    
    private func isUserLoggedIn() -> Bool {
        if let _ = getUserFromUserDefaults() {
            return true
        }
        return false
    }

    
    private func setupMainView() {
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
        self.tabBar.isHidden = false
        
        //MARK: custom font
//        if let customFont = UIFont(name: "YourCustomFont", size: 16) {
//            let attributes: [NSAttributedString.Key: Any] = [
//                NSAttributedString.Key.font: customFont,
//                NSAttributedString.Key.foregroundColor: UIColor.black // You can set the color as desired
//            ]
//            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
//        }
    }
    
    private func setupLoginView() {
        let welcomeTab = UINavigationController(rootViewController: WelcomeViewController())
        self.tabBar.isHidden = true
        self.viewControllers = [welcomeTab]
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

#Preview {
    ViewController()
}
