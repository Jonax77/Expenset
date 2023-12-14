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
        return transactionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Config.transactionTableCellID, for: indexPath) as! TransactionTableViewCell
        let transaction = transactionData[indexPath.row]
        cell.configure(transaction: transaction)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        print("Selected row at index: \(indexPath.row)")
    }
    
    
}
