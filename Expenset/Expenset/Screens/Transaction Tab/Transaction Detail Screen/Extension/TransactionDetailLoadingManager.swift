//
//  TransactionDetailLoadingManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/8/24.
//

import Foundation
import UIKit

extension TransactionDetailViewController {
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
