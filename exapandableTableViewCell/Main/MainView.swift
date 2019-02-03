//
//  MainView.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    // MARK: Subviews
    public let tableView: UITableView = {
        let view: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        view.backgroundColor = UIColor.lightGray
        view.separatorColor = UIColor.clear
        return view
    }()
    
    // MARK: Stored Properties
    private var tableViewBottomConstraint: Constraint?
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [ self.tableView ])
        
        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.leading.trailing.equalToSuperview()
            self.tableViewBottomConstraint = make.bottom.equalToSuperview().constraint
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateLayoutTableView(with cgRect: CGRect) {
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.25) {
            
            switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                break
            default:
                self.tableViewBottomConstraint?.update(inset: cgRect.height + 20)
            }
            
            
        }
    }
    
    public func keyBoardWillHide() {
        UIView.animate(withDuration: 1.25) {
            self.tableViewBottomConstraint?.update(inset: 0.0)
        }
    }
    
}
