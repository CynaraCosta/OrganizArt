//
//  ProductsAddSaleTableViewCell.swift
//  Organizart
//
//  Created by mccl on 21/09/22.
//

import UIKit

class ProductsAddSaleTableViewCell: UITableViewCell {

    private var productTitle: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
//        title.backgroundColor = .cyan
        title.numberOfLines = 0
        title.text = "Cabeça Grande Barro 40x50cm"
        
        return title
        
    }()
    
    private var priceLabel: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
//        title.backgroundColor = .yellow
        title.text = "R$600,00"
        
        return title
        
    }()
    
    
    private var imageProduct: UIImageView = {
        let imageProduct = UIImageView()
        imageProduct.contentMode = .scaleAspectFit
//        imageProduct.backgroundColor = .red
        imageProduct.image = UIImage(named: "cabeca")
        
        return imageProduct
        
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ProductsChosenTableViewCell")
        self.selectionStyle = .none
        self.backgroundColor = .clear
        contentView.backgroundColor = .systemBackground
    
        hierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageProduct)
        stackView.addArrangedSubview(infoStackView)

        infoStackView.addArrangedSubview(productTitle)
        infoStackView.addArrangedSubview(priceLabel)
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        
        
        ])
        
        
        
    }
    
    func set(product: Product) {
        productTitle.text = product.title
        priceLabel.text = "R$\(product.price)"
        imageProduct.image = UIImage(named: product.picture)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
 
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        self.contentView.layer.shadowColor = UIColor.label.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowRadius = 2
        
    }
    

}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ProductsAddSaleTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ProductsAddSaleTableViewCell().showPreview().previewLayout(PreviewLayout.fixed(width: 326, height: 82))
        }
    }
}
#endif
