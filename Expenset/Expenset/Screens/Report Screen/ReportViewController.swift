//
//  ReportViewController.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/4/23.
//

import UIKit

class ReportViewController: UIViewController {
    
    let vv = TransactionDetailView()
    
    override func loadView() {
        view = vv
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Report"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
