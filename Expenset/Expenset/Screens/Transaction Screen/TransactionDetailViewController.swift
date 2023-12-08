//
//  TransactionDetailViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/7/23.
//

import UIKit

class TransactionDetailViewController: UIViewController {
    
    let detailView = TransactionDetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
