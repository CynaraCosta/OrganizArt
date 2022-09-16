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
        orderIdLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
//        orderIdLabel.backgroundColor = .brown
        orderIdLabel.textColor = .label
        orderIdLabel.text = "#014"
        return orderIdLabel
    }()
    
    private var clientNameLabel: UILabel = {
        var clientNameLabel = UILabel()
        clientNameLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        clientNameLabel.textColor = .label
//        clientNameLabel.backgroundColor = .yellow
        clientNameLabel.text = "Cynara Valéria de Oliveira Costa do Amaral Cavalcanti"
        clientNameLabel.numberOfLines = 0
        
        return clientNameLabel
        
    }()
    
    private var firstAmountLabel: UILabel = {
        var amountLabel = UILabel()
        amountLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        amountLabel.textColor = UIColor(named: "purple-700")
//        amountLabel.backgroundColor = .yellow
        amountLabel.text = "15"
        
        return amountLabel
    }()
    
    private var secondAmountLabel: UILabel = {
        var amountLabel = UILabel()
        amountLabel.isHidden = true
        amountLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        amountLabel.textColor = UIColor(named: "purple-700")
//        amountLabel.backgroundColor = .yellow
        amountLabel.text = "15"
        
        return amountLabel
    }()
    
    private var thirdAmountLabel: UILabel = {
        var amountLabel = UILabel()
        amountLabel.isHidden = true
        amountLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        amountLabel.textColor = UIColor(named: "purple-700")
//        amountLabel.backgroundColor = .yellow
        amountLabel.text = "15"
        
        return amountLabel
    }()
    
    private var firstProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        productChosenLabel.textColor = .label
//        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Bordado Santa Conceição"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel

    }()
    
    private var secondProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.isHidden = true
        productChosenLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        productChosenLabel.textColor = .label
//        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Bolsa Tote Canário"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel
        
    }()
    
    private var thirdProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.isHidden = true
        productChosenLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        productChosenLabel.textColor = .label
//        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Cabeça Feminina Neguinha e Nanai GG Personalizada"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel
        
    }()
    
    private var totalPriceLabel: UILabel = {
        var totalPriceLabel = UILabel()
        totalPriceLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        totalPriceLabel.textColor = .label
//        totalPriceLabel.backgroundColor = .darkGray
        totalPriceLabel.text = "R$500,00"
        
        return totalPriceLabel
        
    }()
    
    private var saleFormatLabel: UILabel = {
        var saleFormatLabel = UILabel()
        saleFormatLabel.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        saleFormatLabel.textColor = .label
//        saleFormatLabel.backgroundColor = .yellow
        saleFormatLabel.text = "Feira Bom Jesus"
        saleFormatLabel.numberOfLines = 0
        saleFormatLabel.textAlignment = .center
        saleFormatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return saleFormatLabel
        
    }()
    
    private var tagView: UIView = {
        let tagView = UIView()
        tagView.backgroundColor = UIColor(named: "purple-100")
        tagView.layer.cornerRadius = 6
        tagView.layer.masksToBounds = true
        
        return tagView
        
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
//        stack.backgroundColor = .purple
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    var stackViewInfo: UIStackView = {
        var stackInfo = UIStackView()
//        stackInfo.backgroundColor = .blue
        stackInfo.axis = .vertical
        stackInfo.distribution = .fill
        stackInfo.alignment = .leading
        stackInfo.spacing = 5
        stackInfo.translatesAutoresizingMaskIntoConstraints = false
        stackInfo.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return stackInfo
    }()
    
    var stackViewPrice: UIStackView = {
        var stackPrice = UIStackView()
//        stackPrice.backgroundColor = .black
        stackPrice.axis = .vertical
        stackPrice.distribution = .fill
        stackPrice.alignment = .trailing
        stackPrice.spacing = 7
        stackPrice.translatesAutoresizingMaskIntoConstraints = false

        return stackPrice
    }()
    
    var stackViewFirstAmount: UIStackView = {
        var stackAmount = UIStackView()
//        stackAmount.backgroundColor = .purple
        stackAmount.axis = .horizontal
        stackAmount.distribution = .fill
        stackAmount.alignment = .leading
        stackAmount.spacing = 9

        return stackAmount
    }()
    
    var stackViewSecondAmount: UIStackView = {
        var stackAmount = UIStackView()
//        stackAmount.backgroundColor = .purple
        stackAmount.axis = .horizontal
        stackAmount.distribution = .fill
        stackAmount.alignment = .leading
        stackAmount.spacing = 9

        return stackAmount
    }()
    
    var stackViewThirdAmount: UIStackView = {
        var stackAmount = UIStackView()
//        stackAmount.backgroundColor = .purple
        stackAmount.axis = .horizontal
        stackAmount.distribution = .fill
        stackAmount.alignment = .leading
        stackAmount.spacing = 9

        return stackAmount
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SalesTableViewCell")
    
        hierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(stackViewInfo)
        stackView.addArrangedSubview(stackViewPrice)
        
        stackViewInfo.addArrangedSubview(orderIdLabel)
        stackViewInfo.addArrangedSubview(clientNameLabel)
        stackViewInfo.addArrangedSubview(stackViewFirstAmount)
        stackViewInfo.addArrangedSubview(stackViewSecondAmount)
        stackViewInfo.addArrangedSubview(stackViewThirdAmount)

        
        stackViewFirstAmount.addArrangedSubview(firstAmountLabel)
        stackViewFirstAmount.addArrangedSubview(firstProductChosenLabel)
        
        stackViewSecondAmount.addArrangedSubview(secondAmountLabel)
        stackViewSecondAmount.addArrangedSubview(secondProductChosenLabel)
        
        stackViewThirdAmount.addArrangedSubview(thirdAmountLabel)
        stackViewThirdAmount.addArrangedSubview(thirdProductChosenLabel)
        
        stackViewInfo.addArrangedSubview(UIView())
        
        stackViewPrice.addArrangedSubview(totalPriceLabel)
        stackViewPrice.addArrangedSubview(tagView)
        stackViewPrice.addArrangedSubview(UIView())
        tagView.addSubview(saleFormatLabel)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11.49),
            
            stackViewInfo.widthAnchor.constraint(equalToConstant: 200),
            
            saleFormatLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 2),
            saleFormatLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -2),
            saleFormatLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 13),
            saleFormatLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -13)

            
            
        
        ])
        
    }
    
    
    func set(sale: Sale) {
        orderIdLabel.text = "#\(String(sale.id))"
        clientNameLabel.text = sale.clientName
        firstAmountLabel.text = String(sale.productsChosen[0].amount)
        firstProductChosenLabel.text = sale.productsChosen[0].product.title
        if sale.productsChosen.count == 2 {
            secondProductChosenLabel.isHidden = false
            secondAmountLabel.isHidden = false
            secondAmountLabel.text = String(sale.productsChosen[1].amount)
            secondProductChosenLabel.text = sale.productsChosen[1].product.title
        } else if sale.productsChosen.count == 3 {
            thirdProductChosenLabel.isHidden = false
            thirdAmountLabel.isHidden = false
            thirdAmountLabel.text = String(sale.productsChosen[2].amount)
            thirdProductChosenLabel.text = sale.productsChosen[2].product.title
        }
        
        totalPriceLabel.text = "R$\(String(sale.totalPrice))"
        saleFormatLabel.text = sale.saleFormat

        
    }
    
}



// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SalesTableViewCell_preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            SalesTableViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 326, height: 139))
        }
    }
}
#endif
