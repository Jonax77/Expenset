//
//  LoginFirebaseManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import Foundation
import FirebaseAuth

extension LoginViewController {
    func signInToFirebase(email: String, password: String){
        self.showActivityIndicator()
        //MARK: can you display progress indicator here?
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                self.hideActivityIndicator()
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                self.hideActivityIndicator()
//                self.showAlert(msg: error.debugDescription)
            }
        })
    }
}
