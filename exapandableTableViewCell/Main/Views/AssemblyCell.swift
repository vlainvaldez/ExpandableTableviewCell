//
//  AssemblyCell.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class AssemblyCell: UITableViewCell, MainCell {
    
    // MARK: Subviews
    public let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        return view
    }()
    
    public let assemblyDatePicker: UIDatePicker = {
        let view: UIDatePicker = UIDatePicker()
        view.backgroundColor = UIColor.white
        view.datePickerMode = UIDatePicker.Mode.dateAndTime
        view.minuteInterval = 5
        return view
    }()
    
    public let separatorView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        return view
    }()
    
    
    // MARK: Initializers
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.subviews(forAutoLayout: [ self.assemblyDatePicker, self.separatorView ])
        
        self.assemblyDatePicker.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
        }
        
        self.separatorView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(1.0)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Public API
extension AssemblyCell {
    public static var identifier: String = "AssemblyCell"
}
