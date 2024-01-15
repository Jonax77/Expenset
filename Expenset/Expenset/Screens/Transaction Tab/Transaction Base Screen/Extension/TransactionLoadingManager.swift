//
//  TransactionLoadingManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/20/23.
//

import Foundation
import UIKit

extension TransactionViewController {
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
