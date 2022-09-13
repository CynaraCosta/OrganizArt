//
//  CardViewInvoicing.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class CardViewInvoicing: UIView {
    
//    let cardViewInvoicing = UIView()
//    cardViewInvoicing.layer.cornerRadius = 8
//    // set width at the constraints with constant.frame.width * 0.8
//    return cardViewInvoicing

    private let invoicingValue: UILabel = {
        let invoicingValue = UILabel()
        invoicingValue.text = "R$ 540,98"
        return invoicingValue
    }()
    
    private let invoicingOfMonthLabel: UILabel = {
        let invoicingOfMonthLabel = UILabel()
        invoicingOfMonthLabel.text = "Faturamento do mês"
        return invoicingOfMonthLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCard(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 326, height: 146))
        view.layer.cornerRadius = 8
        view.backgroundColor = .green
        
        view.addSubview(invoicingValue)
        view.addSubview(invoicingOfMonthLabel)
        
    }
    
}
