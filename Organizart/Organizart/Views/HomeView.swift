//
//  HomeView.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class HomeView: UIView {
    
    let card = CardViewInvoicing()

    private let cardView: UIView = {
        let cardView = UIView()
        let teste = UILabel()
        teste.text = "teste"
        cardView.addSubview(teste)
        cardView.backgroundColor = .green
        cardView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
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
        invoicingLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        invoicingLabel.text = "Faturamento"
        invoicingLabel.textColor = .label
        return invoicingLabel
    }()

    private let topProduct: UILabel = {
        let topProduct = UILabel()
        topProduct.text = "Produtos mais vendidos"
        topProduct.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        topProduct.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        topProduct.textColor = .label
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
        addSubview(card)
        addSubview(topProduct)
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
            invoicingLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            invoicingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
        ])

        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: invoicingLabel.bottomAnchor, constant: 8),
            card.leadingAnchor.constraint(equalTo: invoicingLabel.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])

        topProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topProduct.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 24),
            topProduct.leadingAnchor.constraint(equalTo: card.leadingAnchor),
        ])

    }
    
    
}



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView().showPreview().previewDevice("iPhone 13")        }
    }
}
#endif
