//
//  SaleDetailsView.swift
//  Organizart
//
//  Created by mccl on 19/09/22.
//

import UIKit

class SaleDetailsView: UIView {
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        
        return backgroundView
    }()
    
    
    private var orderIdLabel: UILabel = {
        var orderIdLabel = UILabel()
        orderIdLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        orderIdLabel.backgroundColor = .brown
        orderIdLabel.textColor = .label
        orderIdLabel.text = "#014"
        
        
        return orderIdLabel
        
    }()
    
    private var dateLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        date.backgroundColor = .systemRed
        date.text = "20/09/2022"
        
        return date
        
    }()
    
    private var clientNameLabel: UILabel = {
        var name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        name.numberOfLines = 0
        name.textColor = .label
        name.text = "Cynara Valéria de Oliveira Costa do Amaral Cavalcanti"

        
        return name
        
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
    
    var firstStackView: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.backgroundColor = .yellow
        stack.spacing = 195
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    var secondStackView: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .center
        stack.axis = .horizontal
        stack.backgroundColor = .blue
        stack.spacing = 50
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroundView)
        
        hierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hierarchy() {
        self.addSubview(firstStackView)
        self.addSubview(secondStackView)
        
        firstStackView.addArrangedSubview(orderIdLabel)
        firstStackView.addArrangedSubview(dateLabel)
        
        secondStackView.addArrangedSubview(clientNameLabel)
        secondStackView.addArrangedSubview(tagView)
        
        tagView.addSubview(saleFormatLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            firstStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondStackView.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            secondStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondStackView.widthAnchor.constraint(equalToConstant: 326),
            
            saleFormatLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 2),
            saleFormatLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -2),
            saleFormatLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 13),
            saleFormatLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -13),
            
            tagView.widthAnchor.constraint(equalToConstant: 80)
            //modificar isso para ser de acordo com o tamanho da label
            
        
        
        ])
        
        
    }


}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SaleDetails_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            SaleDetailsView().showPreview().previewDevice("iPhone 12")
        }
    }
}
#endif
