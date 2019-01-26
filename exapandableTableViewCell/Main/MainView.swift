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
    
    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [ self.tableView ])
        
        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
