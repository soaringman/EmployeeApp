//
//  EmployeeCell.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 08.11.2022.
//

import UIKit
import SnapKit

class EmployeeCell: UITableViewCell {
    
    //MARK: - static properties
    static let reuseID = "EmployeeCell"
    
    
    private lazy var nameLabel = UILabel()
    private lazy var skillsLabel = UILabel()
    private lazy var phoneNumberLabel = UILabel()
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EmployeeCell.reuseID)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
    }
    
    private func setupConstraints() {
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        
        contentView.addSubview(skillsLabel)
        skillsLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(30)
        }
        
        contentView.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
        }
    }
    
    func configure(name: String,
                   phoneNumber: String,
                   skills: [String]
    ) {
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
        skillsLabel.text = skills.joined(separator: ", ")
    }
    
    
}
