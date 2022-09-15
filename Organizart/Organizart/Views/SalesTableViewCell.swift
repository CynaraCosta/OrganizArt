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
        orderIdLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        orderIdLabel.backgroundColor = .brown
        orderIdLabel.textColor = UIColor(named: "purple-700")
        orderIdLabel.text = "#014"
        return orderIdLabel
    }()
    
    private var clientNameLabel: UILabel = {
        var clientNameLabel = UILabel()
        clientNameLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        clientNameLabel.backgroundColor = .yellow
        clientNameLabel.text = "Cynara Valéria de Oliveira Costa do Amaral Cavalcanti"
        clientNameLabel.numberOfLines = 0
        
        return clientNameLabel
        
    }()
    
    private var firstProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Bordado Santa Conceição"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel

    }()
    
    private var secondProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.isHidden = true
        productChosenLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Bolsa Tote Canário"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel
        
    }()
    
    private var thirdProductChosenLabel: UILabel = {
        var productChosenLabel = UILabel()
        productChosenLabel.isHidden = true
        productChosenLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        productChosenLabel.backgroundColor = .cyan
        productChosenLabel.text = "Cabeça Feminina Neguinha e Nanai GG Personalizada"
        productChosenLabel.numberOfLines = 0
        
        return productChosenLabel
        
    }()
    
    private var totalPriceLabel: UILabel = {
        var totalPriceLabel = UILabel()
        totalPriceLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        totalPriceLabel.backgroundColor = .darkGray
        totalPriceLabel.text = "R$500,00"
        
        return totalPriceLabel
        
    }()
    
    private var saleFormatLabel: UILabel = {
        var saleFormatLabel = UILabel()
        saleFormatLabel.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        saleFormatLabel.backgroundColor = .yellow
        saleFormatLabel.text = "Feira Bom Jesus"
        saleFormatLabel.numberOfLines = 0
        saleFormatLabel.textAlignment = .center
        saleFormatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return saleFormatLabel
        
    }()
    
    private var tagView: UIView = {
        let tagView = UIView()
        tagView.backgroundColor = .green
        tagView.layer.cornerRadius = 6
        tagView.layer.masksToBounds = true
        
        return tagView
        
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        stack.backgroundColor = .purple
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    var stackViewInfo: UIStackView = {
        var stackInfo = UIStackView()
        stackInfo.backgroundColor = .blue
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
        stackPrice.backgroundColor = .black
        stackPrice.axis = .vertical
        stackPrice.distribution = .fill
        stackPrice.alignment = .trailing
        stackPrice.spacing = 7
        stackPrice.translatesAutoresizingMaskIntoConstraints = false
//        stackPrice.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return stackPrice
    }()
    
    var stackViewAmount: UIStackView = {
        var stackAmount = UIStackView()
        stackAmount.backgroundColor = .purple
        
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
        stackViewInfo.addArrangedSubview(firstProductChosenLabel)
        stackViewInfo.addArrangedSubview(secondProductChosenLabel)
        stackViewInfo.addArrangedSubview(thirdProductChosenLabel)
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
            
            stackViewInfo.widthAnchor.constraint(equalToConstant: 216),
            
            saleFormatLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 2),
            saleFormatLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -2),
            saleFormatLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 13),
            saleFormatLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -13)

            
            
        
        ])
        
    }
    
    
    func set(sale: Sale) {
        orderIdLabel.text = String(sale.id)
        clientNameLabel.text = sale.clientName
        firstProductChosenLabel.text = sale.productsChosen[0].title
        if sale.productsChosen.count == 2 {
            secondProductChosenLabel.isHidden = false
            secondProductChosenLabel.text = sale.productsChosen[1].title
        } else if sale.productsChosen.count == 3 {
            thirdProductChosenLabel.isHidden = false
            thirdProductChosenLabel.text = sale.productsChosen[2].title
        }
        
        totalPriceLabel.text = String(sale.totalPrice)
        saleFormatLabel.text = sale.saleFormat

        
    }
    
//    func configureLabels() {
//        orderIdLabel.numberOfLines = 0
//        clientNameLabel.numberOfLines = 0
//        productChosenLabel.numberOfLines = 0
//        totalPriceLabel.numberOfLines = 0
//        saleFormatLabel.numberOfLines = 0
//    }

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
