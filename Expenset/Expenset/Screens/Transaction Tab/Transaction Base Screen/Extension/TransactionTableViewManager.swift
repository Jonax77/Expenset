//
//  TransactionTableViewManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/13/23.
//

import Foundation
import UIKit

extension TransactionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Config.transactionTableCellID, for: indexPath) as! TransactionTableViewCell
        let transaction = transactions[indexPath.row]
        cell.configure(transaction: transaction)
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.clear // Change to your desired selection color
           
        // Assign the selectedBackgroundView to customize the selection color
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        let vc = TransactionDetailViewController()
        let transaction = transactions[indexPath.row]
        vc.transaction = transaction
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the desired height for cells at specific indexPath
        return 100 // Set your desired cell height here
    }
    
    
}
