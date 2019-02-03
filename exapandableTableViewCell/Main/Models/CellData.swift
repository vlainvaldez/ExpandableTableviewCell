//
//  CellData.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

public protocol AssemblyData {}

public struct AssemblyPickerData: AssemblyData {
    var date: String
    var time: String
}

public struct BuildingSiteData: AssemblyData {
    var title: String
}

public class TextFieldData: AssemblyData {
    var text: String
    
    public init(text: String) {
        self.text = text
    }
}

class CellData {
    var isOpened: Bool
    var title: String
    var sectionData: AssemblyData?
    let cellType: CellType
    var isEnabled: Bool = true
    
    public init(isOpened: Bool = false, title: String = "", sectionData: AssemblyData?, cellType: CellType, isEnabled: Bool = true) {
        self.isOpened = isOpened
        self.title = title
        self.sectionData = sectionData
        self.cellType = cellType
        self.isEnabled = isEnabled
    }
}
