//
//  ViewController.swift
//  exapandableTableViewCell
//
//  Created by alvin joseph valdez on 26/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: Initializers
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = MainView()
        self.keyboardManager = KeyboardManager(tableView: self.tableView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewData = [
            CellData(sectionData: nil, cellType: CellType.header),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(title: "Section 2", sectionData: AssemblyPickerData(date: "Jun 19, 1992", time: "9:00"), cellType: CellType.picker),
            CellData(title: "Section 3", sectionData: AssemblyPickerData(date: "Jun 19, 1992", time: "9:00"), cellType: CellType.picker),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(title: "Section 4", sectionData: AssemblyPickerData(date: "Jun 19, 1992", time: "9:00"), cellType: CellType.picker),
            CellData(title: "Section 5", sectionData: AssemblyPickerData(date: "Jun 19, 1992", time: "9:00"), cellType: CellType.picker),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: BuildingSiteData(title: "Items"), cellType: CellType.normal, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: BuildingSiteData(title: "1. Item"), cellType: CellType.normal, isEnabled: false),
            CellData(sectionData: BuildingSiteData(title: "2. Item"), cellType: CellType.normal, isEnabled: false),
            CellData(sectionData: BuildingSiteData(title: "3. Item"), cellType: CellType.normal, isEnabled: false),
            CellData(sectionData: BuildingSiteData(title: "3. Item"), cellType: CellType.normal, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false),
            CellData(sectionData: nil, cellType: CellType.divider),
            CellData(sectionData: TextFieldData(text: ""), cellType: CellType.textField, isEnabled: false)
        ]
        
        self.tableView.register(
            AssemblyCell.self,
            forCellReuseIdentifier: AssemblyCell.identifier
        )
        
        self.tableView.register(
            BuildingSiteCell.self,
            forCellReuseIdentifier: BuildingSiteCell.identifier
        )
        
        self.tableView.register(
            HeaderViewCell.self,
            forCellReuseIdentifier: HeaderViewCell.identifier
        )
        
        self.tableView.register(
            DividerCell.self,
            forCellReuseIdentifier: DividerCell.identifier
        )
        
        self.tableView.register(
            TextFieldCell.self,
            forCellReuseIdentifier: TextFieldCell.identifier
        )
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // NOTE: put this in keynboard manager class
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(MainVC.keyboardWillShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(MainVC.keyboardWillHide),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
        
        self.keyboardManager?.beginObservingKeyboard()
    }
    
    deinit {
        self.keyboardManager?.endObservingKeyboard()
    }
    
    // MARK: Stored Properties
    private var tableViewData: [CellData] = [CellData]()
    private var oldBottomInsets: CGFloat?
    private var keyboardManager: KeyboardManager?
    

}

// MARK: - Views
extension MainVC {
    unowned var rootView: MainView { return self.view as! MainView } // swiftlint:disable:this force_cast
    unowned var tableView: UITableView { return self.rootView.tableView }
}

// MARK: - TableView DataSource Methods
extension MainVC: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.tableViewData[section].cellType {
            case .header, .normal, .group, .divider, .textField:
                return 1
            case .picker:
                switch self.tableViewData[section].isOpened &&
                    self.tableViewData[section].sectionData != nil &&
                    self.tableViewData[section].cellType == CellType.picker {
                    case true:
                        return 2
                    case false:
                        return 1
                }
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch  self.tableViewData[indexPath.section].cellType{
        case .header, .group:
            let cell: BuildingSiteCell = self.create(cell: BuildingSiteCell()) as! BuildingSiteCell
            cell.selectionStyle = .none
            cell.assemblySwitch.addTarget(self, action: #selector(MainVC.switchValueChanged), for: UIControl.Event.valueChanged)
            return cell
        case .normal:
            let cell: HeaderViewCell = self.create(cell: HeaderViewCell()) as! HeaderViewCell
            cell.selectionStyle = .none
            cell.isEnabled(self.tableViewData[indexPath.section].isEnabled)
            
            guard
                let model: BuildingSiteData = self.tableViewData[indexPath.section].sectionData as? BuildingSiteData
            else {
                return UITableViewCell()
            }
            
            cell.configure(title: model.title, time: "")
            
            return cell
            
        case .textField:
            
            let cell: TextFieldCell = self.create(cell: TextFieldCell()) as! TextFieldCell
            cell.selectionStyle = .none
            
            guard
                let model: TextFieldData = self.tableViewData[indexPath.section].sectionData as? TextFieldData
                else {
                    return UITableViewCell()
            }
            
            cell.configure(with: model)
            
            return cell
            
        case .divider:
            let cell: DividerCell = self.create(cell: DividerCell()) as! DividerCell
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            return cell
        case .picker:
            switch indexPath.row == 0 {
            case true:
                
                let cell: HeaderViewCell = self.create(cell: HeaderViewCell()) as! HeaderViewCell
                
                guard
                    let model: AssemblyPickerData = self.tableViewData[indexPath.section].sectionData as? AssemblyPickerData
                else {
                    return UITableViewCell()
                }
                cell.isEnabled(true)
                cell.configure(title: self.tableViewData[indexPath.section].title, time: model.time)
                
                return cell
            case false:
                
                let cell: AssemblyCell = self.create(cell: AssemblyCell()) as! AssemblyCell
                
                return cell
            }
            
            
        }
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = CGFloat()
        
        switch self.tableViewData[indexPath.section].cellType {
            
        case .divider, .group, .header, .normal, .textField:
            height = 45.0
        case .picker:
            switch indexPath.row == 0 {
            case true:
                height = 65.0
            case false:
                height = 200.0
            }
        }
        
        return height
    }
    
}

// MARK: - TableView Delegate Methods
extension MainVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 && indexPath.section != 0 {
            switch self.tableViewData[indexPath.section].isOpened {
            case true:
                self.tableViewData[indexPath.section].isOpened = false
            case false:
                self.tableViewData[indexPath.section].isOpened = true
            }
            
            let sections = IndexSet(integer: indexPath.section)
            self.tableView.reloadSections(sections, with: UITableView.RowAnimation.automatic)
        }
    }
}

// MARK: - Target Functions
extension MainVC {
    
    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func switchValueChanged( _ sender: UISwitch) {
        let value: Bool  = sender.isOn
        
        self.tableViewData = self.tableViewData.map { (cellData: CellData) -> CellData in
            var data: CellData = cellData
            
            if cellData.cellType == .normal {
                data.isEnabled = value
            }
            
            return data
        }
        
        self.tableView.reloadData()
    }
    
//    @objc func keyboardWillShow(notification: Notification) {
//        guard let info: CGRect = notification.userInfo!["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
//
//        self.rootView.layoutIfNeeded()
//
//        self.oldBottomInsets = self.tableView.contentInset.bottom
//
//        let contentInsets: UIEdgeInsets = UIEdgeInsets(
//            top: self.tableView.contentInset.top,
//            left: 0.0,
//            bottom: info.height,
//            right: 0.0
//        )
//
//        self.tableView.contentInset = contentInsets
//        self.tableView.scrollIndicatorInsets = contentInsets
//
//    }
//
//    @objc func keyboardWillHide(){
//        self.rootView.layoutIfNeeded()
//
//        let contentInsets: UIEdgeInsets = UIEdgeInsets(
//            top: self.tableView.contentInset.top,
//            left: 0.0,
//            bottom: 0.0,
//            right: 0.0
//        )
//
//        self.tableView.contentInset = contentInsets
//        self.tableView.scrollIndicatorInsets = contentInsets
//    }

}

// MARK: - Helper Functions

extension MainVC {

    // NOTE: I'll just leave this here so I have a reference on why I have to use generics to lessen the codes
    
//    private func buildingSiteCellBuilder() -> BuildingSiteCell {
//        guard
//            let cell: BuildingSiteCell = self.tableView.dequeueReusableCell(
//                withIdentifier: BuildingSiteCell.identifier
//            ) as? BuildingSiteCell
//        else {
//                return BuildingSiteCell()
//        }
//        return cell
//    }
//
//    private func headerCellBuilder() -> HeaderViewCell {
//        guard
//            let cell: HeaderViewCell = self.tableView.dequeueReusableCell(
//                withIdentifier: HeaderViewCell.identifier
//            ) as? HeaderViewCell
//        else {
//                return HeaderViewCell()
//        }
//        return cell
//    }
//
//
//    private func dividerCellBuilder() -> DividerCell {
//        guard
//            let cell: DividerCell = self.tableView.dequeueReusableCell(
//                withIdentifier: DividerCell.identifier
//            ) as? DividerCell
//        else {
//            return DividerCell()
//        }
//        return cell
//    }
//
//    private func assemblyCellBuilder() -> AssemblyCell {
//        guard
//            let cell: AssemblyCell = self.tableView.dequeueReusableCell(
//                withIdentifier: AssemblyCell.identifier
//            ) as? AssemblyCell
//        else {
//            return AssemblyCell()
//        }
//        return cell
//    }
    
    private func create<Cell: MainCell>(cell: Cell) -> MainCell {
        
        guard
            let cell = self.tableView.dequeueReusableCell(
                withIdentifier: Cell.identifier
            ) as? MainCell
        else { return DividerCell() }
        
        return cell
    }
    
}

