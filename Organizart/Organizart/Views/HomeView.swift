//
//  HomeView.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class HomeView: UIView {
    
    private let cardView: UIView = {
        let cardView = UIView()
        let teste = UILabel()
        return cardView
    }()
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        return backgroundView
    }()
    
    private let invoicingLabel: UILabel = {
        let invoicingLabel = UILabel()
        invoicingLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        invoicingLabel.font = UIFont(name: "ArialHebrew-Bold", size: 28)
        invoicingLabel.text = "Faturamento"
        invoicingLabel.textColor = .label
        return invoicingLabel
    }()
    
    private let topProduct: UILabel = {
        let topProduct = UILabel()
        topProduct.text = "Produtos mais vendidos"
        return topProduct
    }()
    
    private let topSaleFormat: UILabel = {
        let topSaleFormat = UILabel()
        topSaleFormat.text = "Top meios de venda"
        return topSaleFormat
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
        addSubview(invoicingLabel)
        addSubview(cardView)
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
        
        invoicingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invoicingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            invoicingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
        ])
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: invoicingLabel.bottomAnchor, constant: 8),
            cardView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8),
            cardView.leftAnchor.constraint(equalTo: invoicingLabel.leftAnchor)
        ])
        
    }
    
    
}
