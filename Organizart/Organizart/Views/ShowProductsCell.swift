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
        imageProduct.backgroundColor = .red
//        imageProduct.image = UIImage(named: "cabeca")
        imageProduct.contentMode = .scaleAspectFit
        imageProduct.clipsToBounds = true
        return imageProduct
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(nameProductLabel)
        contentView.addSubview(priceProductLabel)
        contentView.addSubview(stockProductLabel)
        contentView.addSubview(imageProduct)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        
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
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent(photo).path
        if FileManager.default.fileExists(atPath: filePath) {
            let image = UIImage(contentsOfFile: filePath)!
            imageProduct.image = image
        }
        
//        imageProduct.image = new
        
//        imageProduct.image = UIImage(named: "cabeca")
    }

}
