//
//  TopSalesTableViewCell.swift
//  Organizart
//
//  Created by mccl on 22/09/22.
//

import UIKit

class TopSalesTableViewCell: UITableViewCell {
    
    
    private var productTitle: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        title.backgroundColor = .cyan
        title.numberOfLines = 0
        title.text = "Cabeça Grande Barro 40x50cm"
        
        return title
        
    }()
    
    private var priceLabel: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        title.backgroundColor = .yellow
        title.text = "2x R$600,00"
        
        return title
        
    }()
    
    
    private var rankLabel: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        title.backgroundColor = .brown
        title.text = "2"
        
        return title
        
    }()
    
    var infoStackView: UIStackView = {
        var stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        stack.spacing = 18
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    let chevronView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TopProductsTableViewCell")
        
        hierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(rankLabel)
        stackView.addArrangedSubview(infoStackView)
        
        
        
        infoStackView.addArrangedSubview(productTitle)
        infoStackView.addArrangedSubview(priceLabel)
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            
            
            
        ])
        
        
        
    }
    
    func set(saleFormat: String, index: Int) {
        productTitle.text = saleFormat
        let randomInt = Int.random(in: 0...50000)
        priceLabel.text = "R$ \(randomInt) em vendas"
        rankLabel.text = String(index)
        
        
        
    }
    
    
    
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TopSalesTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            TopSalesTableViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 326, height: 80))
        }
    }
}
#endif
