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
    private lazy var phoneNumberLabel = UILabel()
    private lazy var skillsLabel = UILabel()
    
    private lazy var vNamePhoneStack = UIStackView(arrangedSubviews: [nameLabel, phoneNumberLabel])
    private lazy var hContentStack = UIStackView(arrangedSubviews: [vNamePhoneStack, skillsLabel])
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EmployeeCell.reuseID)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    
    private func setupUI() {
        nameLabel.font = .boldSystemFont(ofSize: 17)
        phoneNumberLabel.font = .italicSystemFont(ofSize: 17)
        vNamePhoneStack.axis = .vertical
        vNamePhoneStack.distribution = .fillEqually
        vNamePhoneStack.spacing = 5
        hContentStack.axis = .horizontal
        hContentStack.distribution = .fillEqually
        skillsLabel.numberOfLines = 0
        skillsLabel.sizeToFit()
        self.selectionStyle = .none
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        contentView.addSubview(hContentStack)
        hContentStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    //MARK: - Configure Labels
    
    func configure(name: String,
                   phoneNumber: String,
                   skills: [String]
    ) {
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
        skillsLabel.text = skills.joined(separator: ", ")
    }
}
