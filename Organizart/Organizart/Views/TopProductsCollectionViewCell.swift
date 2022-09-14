//
//  TopProductsCollectionViewCell.swift
//  Organizart
//
//  Created by Joana Lima on 14/09/22.
//

import UIKit

class TopProductsCollectionViewCell: UICollectionViewCell {
    static let identifier = "TopProductsCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let image = [UIImage(named: "bombo infantil"),
                     UIImage(named: "bordado"),
                     UIImage(named: "bota telha"),
                     UIImage(named: "cabeca"),
                     UIImage(named: "escultura")
        ].compactMap({$0})
        imageView.image = image.randomElement() //as imagens estao randomizadas, tem q ajeitar isso, n consegui achar um jeito de fazer e na verdade na verdade precisa puxar do modelo
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    
    //    func setup(title: String, image: UIImage){
    //        titleLabel.text = title
    //        imageView.image = image  //a celular se constroi sozinha pegando as infromaçoes e colocando na view
    //
    //    }
    
}
