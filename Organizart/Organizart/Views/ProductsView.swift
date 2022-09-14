//
//  ProductsView.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class ProductsView: UIView {
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        return backgroundView
    }()
    
    
    private let productsLabel: UILabel = {
        let productsLabel = UILabel()
        productsLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        productsLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        productsLabel.text = "Produtos"
        productsLabel.textColor = .label
        return productsLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundView)
        self.addSubview(productsLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        
        productsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            productsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
        ])
        
    }
    
}
