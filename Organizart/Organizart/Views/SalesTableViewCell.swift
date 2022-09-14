//
//  SalesTableViewCell.swift
//  Organizart
//
//  Created by mccl on 14/09/22.
//

import UIKit

class SalesTableViewCell: UITableViewCell {
    
    private var orderIdLabel: UILabel = {
        var orderIdLabel = UILabel()
        orderIdLabel.textColor = UIColor(named: "purple-700")
        return orderIdLabel
    }()
    var clientNameLabel = UILabel()
    var productChosenLabel = UILabel()
    // ver como trazer o array de produtos escolhidos e aumentar conforme ele
    var totalPriceLabel = UILabel()
    var saleFormatLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SalesTableViewCell")
        addSubview(orderIdLabel)
        addSubview(clientNameLabel)
        addSubview(productChosenLabel)
        addSubview(totalPriceLabel)
        addSubview(saleFormatLabel)
        
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(sale: Sale) {
        orderIdLabel.text = String(sale.id)
        clientNameLabel.text = sale.clientName
        productChosenLabel.text = sale.productsChosen[0].title
        // colocando so o primeiro produto pra ver como fica
        totalPriceLabel.text = String(sale.totalPrice)
        saleFormatLabel.text = sale.saleFormat

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        orderIdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderIdLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            orderIdLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        ])
    }
    
    func configureLabels() {
        orderIdLabel.numberOfLines = 0
        clientNameLabel.numberOfLines = 0
        productChosenLabel.numberOfLines = 0
        totalPriceLabel.numberOfLines = 0
        saleFormatLabel.numberOfLines = 0
    }

}
