//
//  CardViewSale.swift
//  Organizart
//
//  Created by mccl on 16/09/22.
//

import UIKit

class CardViewSale: UIView {
    
    private let quoteLabel: UILabel = {
        let quoteLabel = UILabel()
        quoteLabel.text = "Vendeu? Vem anotar!"
        quoteLabel.font = .systemFont(ofSize: 22.0, weight: .bold)
        quoteLabel.textColor = .white
        quoteLabel.numberOfLines = 0
        
        return quoteLabel
    }()
    
    private let registerLabel: UILabel = {
       let registerLabel = UILabel()
        registerLabel.text = "Registre aqui sua nova venda"
        registerLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        registerLabel.textColor = .white
        registerLabel.numberOfLines = 0
        
        return registerLabel
    }()
    
    private let chevron: UIImageView = {
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.forward")
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = .white
        
        return chevron
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
//        stack.backgroundColor = UIColor(named: "purple-500")
        stack.layer.cornerRadius = 8
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 76.49
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
//        stack.backgroundColor = .black
        stack.distribution = .fill
        stack.alignment = .leading
        
        return stack
    }()
    
    let chevronStackView: UIStackView = {
       let chevronStackView = UIStackView()
        chevronStackView.alignment = .trailing
        chevronStackView.axis = .vertical
        chevronStackView.distribution = .fill
        
        return chevronStackView
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        hierarchy()
        SetConstraints()
        setupCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(labelsStackView)
        stackView.addArrangedSubview(chevronStackView)
        
        chevronStackView.addSubview(chevron)
        
        labelsStackView.addArrangedSubview(quoteLabel)
        labelsStackView.addArrangedSubview(registerLabel)
        
    }
    
    func SetConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11.49),
            stackView.widthAnchor.constraint(equalToConstant: 326),
            
            
            chevron.centerYAnchor.constraint(equalTo: chevronStackView.centerYAnchor),
            
            self.widthAnchor.constraint(equalToConstant: 326)
        
        ])
        
    }
    
    func setupCard() {
        self.backgroundColor = UIColor(named: "purple-500")
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4
        
        
    }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CardViewSale_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            CardViewSale().showPreview().previewLayout(PreviewLayout.fixed(width: 326, height: 69))
        }
    }
}
#endif
