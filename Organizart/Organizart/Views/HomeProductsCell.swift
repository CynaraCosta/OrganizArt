//
//  HomeProductsCell.swift
//  Organizart
//
//  Created by sofiadinizms on 19/09/22.
//

import UIKit

class HomeProductsCell: UICollectionViewCell {
    static let identifier = "HomeProductsCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
        
    }()
    
    private let nameLabel: UILabel = {
        var productName = UILabel()
        productName.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        productName.textColor = .label
        productName.text = "Nome do produto"
        productName.numberOfLines = 0
        
        return productName
    }()
    
    private let unitsLabel: UILabel = {
        var unitsNumber = UILabel()
        unitsNumber.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        unitsNumber.textColor = .label
        unitsNumber.text = "20 peças vendidas"
        unitsNumber.numberOfLines = 0
        
        return unitsNumber
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(unitsLabel)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.05
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 5
        
        let images = [
            UIImage(named: "bombo infantil"),
            UIImage(named: "bordado"),
            UIImage(named: "bota telha"),
            UIImage(named: "ovo em ceramica"),
            UIImage(named: "planner"),
            UIImage(named: "animais na vertical"),
            
        ].compactMap({ $0 })
        
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)

        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        unitsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            unitsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            unitsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            unitsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
}
