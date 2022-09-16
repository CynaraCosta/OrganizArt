//
//  ShowProductsCell.swift
//  Organizart
//
//  Created by Cynara Costa on 14/09/22.
//

import UIKit

class ShowProductsCell: UITableViewCell {

    static let identifier = "ShowProductsCell"
    
    private var nameProductLabel: UILabel = {
        let nameProductLabel = UILabel()
        nameProductLabel.textColor = .label
        nameProductLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return nameProductLabel
    }()
    
    private var priceProductLabel: UILabel = {
        let priceProductLabel = UILabel()
        priceProductLabel.textColor = .label
        priceProductLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return priceProductLabel
    }()
    
    private var stockProductLabel: UILabel = {
        let stockProductLabel = UILabel()
        stockProductLabel.textColor = .label
        stockProductLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return stockProductLabel
    }()
    
    private var imageProduct: UIImageView = {
        let imageProduct = UIImageView()
        imageProduct.contentMode = .scaleAspectFit
        imageProduct.backgroundColor = .red
        imageProduct.image = UIImage(named: "cabeca")
        return imageProduct
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        self.contentView.addSubview(nameProductLabel)
        self.contentView.addSubview(priceProductLabel)
        self.contentView.addSubview(stockProductLabel)
        self.contentView.addSubview(imageProduct)
        
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageProduct.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageProduct.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
        ])
        
        nameProductLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameProductLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            nameProductLabel.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 18),
        ])
        
        priceProductLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceProductLabel.topAnchor.constraint(equalTo: nameProductLabel.bottomAnchor, constant: 4),
            priceProductLabel.leadingAnchor.constraint(equalTo: nameProductLabel.leadingAnchor),
        ])
        
        stockProductLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockProductLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stockProductLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
        
    }
    
    public func configure(name: String, price: String, stock: String, photo: String){
        nameProductLabel.text = name
        priceProductLabel.text = "R$ " + price
        stockProductLabel.text = stock
        imageProduct.image = UIImage(named: "cabeca")
    }

}
