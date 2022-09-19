//
//  ProductView.swift
//  Organizart
//
//  Created by Cynara Costa on 19/09/22.
//

import UIKit

class ProductView: UIView {
    
    @objc private func increase(){
                
        guard let value = Int(stockValue.text ?? "0") else {return}
        
        let newValue = value + 1
        stockValue.text = String(newValue)
        stockValue.reloadInputViews()
        
    }
    
    @objc private func decrease(){
        
        guard let value = Int(stockValue.text ?? "0") else {return}
        
        var newValue = value - 1
        
        if newValue < 0 {
            newValue = 0
        }
        
        stockValue.text = String(newValue)
        stockValue.reloadInputViews()
    }

    private var imageProduct: UIImageView = {
        let imageProduct = UIImageView()
        imageProduct.contentMode = .scaleAspectFit
        imageProduct.clipsToBounds = true
        imageProduct.layer.masksToBounds = true
        imageProduct.layer.cornerRadius = 8
        imageProduct.image = UIImage(named: "cabeca-1")
        return imageProduct
    }()
    
    lazy private var buttonMinus: UIButton = {
        let buttonPlusP = UIButton()
        buttonPlusP.setTitle("-", for: .normal)
        buttonPlusP.layer.cornerRadius = 8
        buttonPlusP.layer.masksToBounds = true
        buttonPlusP.backgroundColor = UIColor(named: "purple-700")
        buttonPlusP.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        return buttonPlusP
    }()
    
    lazy private var buttonPlus: UIButton = {
        let buttonMinusP = UIButton()
        buttonMinusP.setTitle("+", for: .normal)
        buttonMinusP.layer.cornerRadius = 8
        buttonMinusP.layer.masksToBounds = true
        buttonMinusP.backgroundColor = UIColor(named: "purple-700")
        buttonMinusP.addTarget(self, action: #selector(increase), for: .touchUpInside)
        return buttonMinusP
    }()
    
    private var stockValue: UITextField = {
        var stockValue = UITextField()
        stockValue.text = "1"
        stockValue.textColor = .white
        stockValue.textAlignment = .center
        stockValue.returnKeyType = .done
        stockValue.keyboardType = UIKeyboardType.numberPad
        stockValue.layer.cornerRadius = 8
        stockValue.backgroundColor = UIColor(named: "purple-700")
        
        //        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
        //                                                       , height: 20))
        //        stockValue.leftView = paddingView
        //        stockValue.leftViewMode = .always
        
        return stockValue
    }()
    
    private var titleProduct: UILabel = {
        let titleProduct = UILabel()
        titleProduct.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleProduct.tintColor = .label
        titleProduct.text = "Placeholder title"
        return titleProduct
    }()
    
    private var descriptionProduct: UILabel = {
        let descriptionProduct = UILabel()
        descriptionProduct.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionProduct.tintColor = .label
        descriptionProduct.text = "Placeholder description Placeholder description Placeholder description Placeholder description Placeholder description Placeholder description Placeholder description Placeholder description"
        descriptionProduct.numberOfLines = 0
        return descriptionProduct
    }()
    
    private var buttonDelete: UIButton = {
        let buttonDelete = UIButton()
        buttonDelete.setTitle("Excluir produto", for: .normal)
        buttonDelete.titleLabel?.textColor = .label
        buttonDelete.backgroundColor = UIColor(named: "red-700")
        buttonDelete.layer.cornerRadius = 8
        return buttonDelete
    }()
    
    private var cardValue: UIView = {
        let cardValue = UIView()
        cardValue.backgroundColor = .red
        
        let valueLabel = UILabel()
        
        valueLabel.text = "Valor"
        valueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        let realLabel = UILabel()
        realLabel.text = "R$600,00"
        realLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        realLabel.frame = CGRect(x: 0, y: 0, width: 32, height: 0)
        
        cardValue.addSubview(valueLabel)
        cardValue.addSubview(realLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: cardValue.leadingAnchor, constant: 8),
            valueLabel.centerYAnchor.constraint(equalTo: cardValue.centerYAnchor)
        ])
        
        realLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            realLabel.trailingAnchor.constraint(equalTo: cardValue.trailingAnchor, constant: -32),
            realLabel.trailingAnchor.constraint(equalTo: cardValue.trailingAnchor, constant: -64),
            realLabel.centerYAnchor.constraint(equalTo: cardValue.centerYAnchor)
        ])
        
        return cardValue
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        self.addSubview(imageProduct)
        self.addSubview(stockValue)
        self.addSubview(buttonMinus)
        self.addSubview(buttonPlus)
        self.addSubview(titleProduct)
        self.addSubview(descriptionProduct)
        self.addSubview(cardValue)
        self.addSubview(buttonDelete)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            imageProduct.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            imageProduct.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            imageProduct.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            imageProduct.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
        ])
        
        stockValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockValue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            stockValue.widthAnchor.constraint(equalToConstant: 42),
            stockValue.widthAnchor.constraint(equalTo: buttonMinus.widthAnchor),
            stockValue.heightAnchor.constraint(equalTo: buttonMinus.heightAnchor),
            stockValue.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: -16)
        ])
        
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonMinus.topAnchor.constraint(equalTo: stockValue.topAnchor),
            buttonMinus.trailingAnchor.constraint(equalTo: stockValue.leadingAnchor, constant: -4)
        ])
        
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlus.topAnchor.constraint(equalTo: stockValue.topAnchor),
            buttonPlus.leadingAnchor.constraint(equalTo: stockValue.trailingAnchor, constant: 4)
        ])
        
        titleProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleProduct.topAnchor.constraint(equalTo: stockValue.bottomAnchor, constant: 32),
            titleProduct.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])
        
        descriptionProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: 8),
            descriptionProduct.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            descriptionProduct.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ])
        
        cardValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            cardValue.topAnchor.constraint(equalTo: descriptionProduct.bottomAnchor, constant: 32),
            cardValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 32)
        ])
        
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDelete.topAnchor.constraint(equalTo: cardValue.bottomAnchor, constant: 32),
            buttonDelete.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            buttonDelete.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
//            buttonDelete.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16)
        ])
        
    }

}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ProductView_preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ProductView().showPreview().previewLayout(PreviewLayout.fixed(width: 326, height: 139))
        }
    }
}
#endif
