//
//  CustomButton.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)        
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = UIColor.blue
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = UIColor.yellow
        }
    }
}
