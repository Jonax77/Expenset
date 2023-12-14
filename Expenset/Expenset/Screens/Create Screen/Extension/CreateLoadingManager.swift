//
//  CreateLoadingManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/12/23.
//

import Foundation

extension CreateViewController: LoadingDelegate {

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
