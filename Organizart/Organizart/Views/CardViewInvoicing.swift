//
//  CardViewInvoicing.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class CardViewInvoicing: UIButton {
    
//    let cardViewInvoicing = UIView()
//    cardViewInvoicing.layer.cornerRadius = 8
//    // set width at the constraints with constant.frame.width * 0.8
//    return cardViewInvoicing
//    lalal

    private let invoicingValue: UILabel = {
        let invoicingValue = UILabel()
        invoicingValue.text = "R$ 540,98"
        invoicingValue.textColor = .label
        invoicingValue.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        invoicingValue.numberOfLines = 0
        invoicingValue.translatesAutoresizingMaskIntoConstraints = false
        return invoicingValue
    }()
    
    private let invoicingOfMonthLabel: UILabel = {
        let invoicingOfMonthLabel = UILabel()
        invoicingOfMonthLabel.text = "Faturamento do mês"
        invoicingOfMonthLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        invoicingOfMonthLabel.numberOfLines = 2
        invoicingOfMonthLabel.textColor = .label
        return invoicingOfMonthLabel
    }()
    
    private let chartImage: UIImageView = {
        let chartImage = UIImageView(image: UIImage(named: "arrow-chart"))
        chartImage.contentMode = .scaleAspectFit
        return chartImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCard(){
        
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
        
        self.addSubview(invoicingValue)
        self.addSubview(invoicingOfMonthLabel)
        self.addSubview(chartImage)
        
        setupConstraint()
        
    }
    
    func setupConstraint(){
        
        
        NSLayoutConstraint.activate([
            invoicingValue.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            invoicingValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            invoicingValue.trailingAnchor.constraint(equalTo: chartImage.leadingAnchor, constant: 4),
            invoicingValue.bottomAnchor.constraint(equalTo: invoicingOfMonthLabel.topAnchor, constant: -16)
        ])
        
        invoicingOfMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invoicingOfMonthLabel.leadingAnchor.constraint(equalTo: invoicingValue.leadingAnchor),
            invoicingOfMonthLabel.widthAnchor.constraint(equalToConstant: 97),
            invoicingOfMonthLabel.trailingAnchor.constraint(equalTo: chartImage.leadingAnchor, constant: -92),
            invoicingOfMonthLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -29)
        ])
        
        chartImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chartImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            chartImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            chartImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CardViewInvoicing_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            CardViewInvoicing().showPreview().previewDevice("iPhone 13")        }
    }
}
#endif
