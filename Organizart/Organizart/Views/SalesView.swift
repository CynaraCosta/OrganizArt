//
//  SalesView.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class SalesView: UIView {
    
    let card = CardViewSale()
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        
        return backgroundView
    }()
    
    private let salesLabel: UILabel = {
        let salesLabel = UILabel()
        salesLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        salesLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        salesLabel.text = "Vendas"
        salesLabel.textColor = .label
        salesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return salesLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(backgroundView)
        self.addSubview(card)
        self.addSubview(salesLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            salesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            salesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            
            
            card.topAnchor.constraint(equalTo: topAnchor, constant: 113),
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
            
        ])
        
        
    }
    
}
