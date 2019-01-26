//
//  HeaderViewCell.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class HeaderViewCell: UITableViewCell, MainCell {
    
    // MARK: Subviews
    public let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        return view
    }()
    
    public let dateLabel: UILabel = {
        let view: UILabel = UILabel()
        return view
    }()
    
    public let timeLabel: UILabel = {
        let view: UILabel = UILabel()
        return view
    }()
    
    public let separatorView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        return view
    }()
    
    public let whiteMaskView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.subviews(forAutoLayout: [
            self.titleLabel, self.dateLabel,
            self.timeLabel, self.separatorView,
            self.whiteMaskView
            ]
        )
        
        self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
        }
        
        self.timeLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10.0)
        }
        
        self.dateLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.timeLabel.snp.trailing).inset(30.0)
        }
        
        self.separatorView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(1.0)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        self.whiteMaskView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderViewCell {
    
    public static var identifier: String = "HeaderViewCell"
    
    public func configure(title: String, date: String = "", time: String) {
        self.titleLabel.text = title
        self.timeLabel.text = time
        self.dateLabel.text = date
    }
    
    public func isEnabled(_ isEnabled: Bool) {
        self.bringSubviewToFront(self.whiteMaskView)
        self.whiteMaskView.isHidden = isEnabled
    }
}
