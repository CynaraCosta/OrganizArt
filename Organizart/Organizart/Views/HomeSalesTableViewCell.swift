//
//  HomeSalesTableViewCell.swift
//  Organizart
//
//  Created by sofiadinizms on 21/09/22.
//

import UIKit

class HomeSalesTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    private let nameLabel: UILabel = {
        var methodName = UILabel()
        methodName.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        methodName.textColor = .label
        methodName.text = "Nome do produto"
        methodName.numberOfLines = 0
        
        return methodName
    }()
    
    private let salesLabel: UILabel = {
        var amountSold = UILabel()
        amountSold.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        amountSold.textColor = .label
        amountSold.text = "R$900,00"
        amountSold.numberOfLines = 0
        
        return amountSold
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.05
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 5
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(salesLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        
        salesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            salesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            salesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        
        
        
    }
    

}
