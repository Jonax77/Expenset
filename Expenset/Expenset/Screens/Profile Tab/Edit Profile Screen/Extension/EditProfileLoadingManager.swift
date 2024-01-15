//
//  EditProfileLoadingManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/17/23.
//

import Foundation
import UIKit

extension EditProfileViewController: LoadingDelegate {

    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }


}
