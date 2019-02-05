//
//  KeyboardManager.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 05/02/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardManager: NSObject {
    
    // MARK: Stored Properties
    public let tableView: UITableView
    public let notificationCenter: NotificationCenter = NotificationCenter.default
    
    // MARK: Initializers
    public init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    // MARK: Instance Methods
    public func beginObservingKeyboard() {
        self.notificationCenter.addObserver(
            self,
            selector: #selector(KeyboardManager.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        self.notificationCenter.addObserver(
            self,
            selector: #selector(KeyboardManager.keyboardDidHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    public func endObservingKeyboard() {
        self.notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        self.notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    
    
}

// MARK: Target Actions
extension KeyboardManager {
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let info: CGRect = notification.userInfo!["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }        
        
        let contentInsets: UIEdgeInsets = UIEdgeInsets(
            top: self.tableView.contentInset.top,
            left: 0.0,
            bottom: info.height,
            right: 0.0
        )
        
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets

    }
    
    @objc func keyboardDidHide() {
        
        let contentInsets: UIEdgeInsets = UIEdgeInsets(
            top: self.tableView.contentInset.top,
            left: 0.0,
            bottom: 0.0,
            right: 0.0
        )
        
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }
}
