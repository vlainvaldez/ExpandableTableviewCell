//
//  TextFieldCell.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 02/02/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public final class TextFieldCell: UITableViewCell, MainCell {
    
    public let textInput: UITextField = {
        let view: UITextField = UITextField()
        view.placeholder = "Place Holder Text"
        view.returnKeyType = UIReturnKeyType.done
        return view
    }()
    
    // MARK: Stored Properties
    private var modelData: TextFieldData?
    
    
    // MARK: Initializers
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.textInput
        ])
        
        self.textInput.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(40.0)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
        }
        
        self.textInput.delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Public API
extension TextFieldCell {
    public static var identifier: String = "TextFieldCell"
    
    public func configure(with model: TextFieldData) {
        self.textInput.text = model.text
        
        self.modelData = model
    }
}

// MARK: - TextField Delegate Methods
extension TextFieldCell: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        
        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let text = textField.text {
            self.modelData?.text = text
        }
        
    }
    
}
