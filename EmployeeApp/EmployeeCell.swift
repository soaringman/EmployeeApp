//
//  EmployeeCell.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 08.11.2022.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    //MARK: - static properties
    static let reuseID = "EmployeeCell"
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EmployeeCell.reuseID)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
