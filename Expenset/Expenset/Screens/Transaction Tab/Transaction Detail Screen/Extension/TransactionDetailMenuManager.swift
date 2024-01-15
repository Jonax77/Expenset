//
//  TransactionDetailMenuManager.swift
//  Expenset
//
//  Created by Zhiyun Lin on 12/17/23.
//

import Foundation
import UIKit

extension TransactionDetailViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
            // Create and return your UIMenu with UIAction items
            let action1 = UIAction(title: "Action 1", handler: { _ in
                // Handle action 1
            })
            let action2 = UIAction(title: "Action 2", handler: { _ in
                // Handle action 2
            })
            // Add more actions as needed
            
            return UIMenu(title: "", children: [action1, action2])
        }
    }
}
