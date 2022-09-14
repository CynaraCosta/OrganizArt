//
//  ShowProductsCell.swift
//  Organizart
//
//  Created by Cynara Costa on 14/09/22.
//

import UIKit

class ShowProductsCell: UITableViewCell {

    static let identifier = "ShowProductsCell"
    
    private var labelteste: UILabel = {
        let labelteste = UILabel()
        labelteste.text = "aaa"
        return labelteste
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .blue
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
    }

}
