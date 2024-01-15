//
//  TransactionSearchManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 1/8/24.
//

import Foundation
import UIKit

extension TransactionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Invalidate the previous timer when new text is entered
        searchTimer?.invalidate()
        
        // Start a new timer to delay the query by 1 second after the user stops typing
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] _ in
            self?.performSearch(with: searchText)
        }
    }

    func performSearch(with searchText: String) {
        self.getTransactionBySearch(with: searchText)
    }
}
