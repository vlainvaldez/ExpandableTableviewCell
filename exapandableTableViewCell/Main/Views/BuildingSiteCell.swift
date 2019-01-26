//
//  BuildingSiteCell.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class BuildingSiteCell: UITableViewCell {
    
    // MARK: Subviews
    public let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Assembly building site"
        return view
    }()
    
    public let assemblySwitch: UISwitch = {
        let view: UISwitch = UISwitch()
        return view
    }()
    
    
    // MARK: Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.subviews(forAutoLayout: [
                self.titleLabel, self.assemblySwitch
            ]
        )
        
        self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
        }
        
        self.assemblySwitch.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10.0)
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public API
extension BuildingSiteCell {
    
    public static let identifier: String = "BuildingSiteCell"
    
}
