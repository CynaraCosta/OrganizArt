//
//  ProductView.swift
//  Organizart
//
//  Created by Cynara Costa on 19/09/22.
//

import UIKit

class ProductView: UIViewController {
    
    public var product = Produto_CoreData()
    private let HomeVC = HomeViewController()
    
    @objc private func back(){
        dismiss(animated: true)
        let newStock = Int32(stockValue.text!)
        HomeVC.updateStockProduct(product: product, newStock: newStock!)
        
        let newTitle = titleProduct.text
        let newDescription = descriptionProduct.text
        let newPrice = realLabel.text
   
        
        HomeVC.updateTitleProduct(product: product, newTitle: newTitle!)
        HomeVC.updateDescriptionProduct(product: product, newDescription: newDescription!)
        HomeVC.updatePriceProduct(product: product, newPrice: Float(newPrice!)!)
        
        
    }
    
    
    @objc private func edit(){
        titleProduct.backgroundColor = .secondarySystemBackground
        titleProduct.isEditable = true
        realLabel.backgroundColor = .secondarySystemBackground
        realLabel.isEditable = true
        descriptionProduct.backgroundColor = .secondarySystemBackground
        descriptionProduct.isEditable = true
    }
    
    @objc private func deleteProduct(){
        HomeVC.getAllProducts()
        HomeVC.deleteProduct(product: product)
        dismiss(animated: true)
    }
    
    
    @objc private func increase(){
        
        guard let value = Int(stockValue.text ?? "0") else {return}
        
        let newValue = value + 1
        stockValue.text = String(newValue)
        stockValue.reloadInputViews()
        HomeVC.updateStockProduct(product: product, newStock: Int32(newValue))
        
    }
    
    @objc private func decrease(){
        
        guard let value = Int(stockValue.text ?? "0") else {return}
        
        var newValue = value - 1
        
        if newValue < 0 {
            newValue = 0
        }
        
        stockValue.text = String(newValue)
        stockValue.reloadInputViews()
        HomeVC.updateStockProduct(product: product, newStock: Int32(newValue))
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
        
        
        return stockValue
    }()
    
    private let titleProduct: UITextView = {
        let teste = UITextView()
        teste.text = "Placeholder title"
        teste.textColor = .label
        teste.backgroundColor = .clear
        teste.layer.cornerRadius = 8
        teste.isEditable = false
        teste.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        teste.isScrollEnabled = false
        return teste
    }()
    
    private let descriptionProduct: UITextView = {
        let teste = UITextView()
        teste.text = "Placeholder description Placeholder"
        teste.textColor = .label
        teste.backgroundColor = .clear
        teste.layer.cornerRadius = 8
        teste.isEditable = false
        teste.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        teste.isScrollEnabled = false
        teste.frame.size.height = teste.contentSize.height
        
        return teste
    }()
    
    
    private var buttonDelete: UIButton = {
        let buttonDelete = UIButton()
        buttonDelete.setTitle("Excluir produto", for: .normal)
        buttonDelete.titleLabel?.textColor = .label
        //        buttonDelete.backgroundColor = UIColor(named: "red-700")
        buttonDelete.layer.cornerRadius = 8
        buttonDelete.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
        if (buttonDelete.isSelected) {
            buttonDelete.backgroundColor = .blue
        } else {
            buttonDelete.backgroundColor = UIColor(named: "red-700")
        }
        return buttonDelete
    }()
    
    private var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.text = ""
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return valueLabel
    }()
    
    private let realLabel: UITextView = {
        let teste = UITextView()
        teste.text = "R$ 600,00"
        teste.textColor = .label
        teste.backgroundColor = .clear
        teste.layer.cornerRadius = 8
        teste.isEditable = false
        teste.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return teste
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(imageProduct)
        self.view.addSubview(stockValue)
        self.view.addSubview(buttonMinus)
        self.view.addSubview(buttonPlus)
        self.view.addSubview(descriptionProduct)
        //        self.view.addSubview(valueLabel)
        self.view.addSubview(realLabel)
        self.view.addSubview(buttonDelete)
        self.view.addSubview(titleProduct)
        
        self.view.insetsLayoutMarginsFromSafeArea = true
        titleProduct.delegate = self
        descriptionProduct.delegate = self
        realLabel.delegate = self
        hideKeyboardWhenTappedAround()
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        let appearence = UINavigationBarAppearance()
        appearence.configureWithTransparentBackground()
        
        navBar.standardAppearance = appearence
        
        //        navBar.isTranslucent = true
        //        navBar.backgroundColor = .clear
        
        view.addSubview(navBar)
        
        
        let navItem = UINavigationItem(title: product.title)
        
        let backItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: nil, action: #selector(back))
        let backItem2 = UIBarButtonItem(title: "Voltar", style: .done, target: nil, action: #selector(back))
        
        let editItem = UIBarButtonItem(title: "Editar", style: .done, target: nil, action: #selector(edit))
        
        
        editItem.tintColor = UIColor(named: "purple-700")
        backItem.tintColor = UIColor(named: "purple-700")
        backItem2.tintColor = UIColor(named: "purple-700")
        
        
        navItem.rightBarButtonItem = editItem
        
        
        navItem.leftBarButtonItems = [backItem, backItem2]
        
        navBar.setItems([navItem], animated: false)
        
        setupConfigProduct()
        setupConstraints()
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupConfigProduct(){
        
        stockValue.text = String(product.stock)
        realLabel.text = String(product.price)
        descriptionProduct.text = product.description_
        titleProduct.text = product.title
        
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent(product.picture!).path
        if FileManager.default.fileExists(atPath: filePath) {
            let image = UIImage(contentsOfFile: filePath)!
            imageProduct.image = image
            
        }
        
    }
    
    func setupConstraints() {
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageProduct.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            imageProduct.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            imageProduct.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 76),
            imageProduct.widthAnchor.constraint(equalToConstant: 326),
            imageProduct.heightAnchor.constraint(equalToConstant: 326)
            
            
        ])
        
        stockValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
            titleProduct.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            titleProduct.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            titleProduct.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        descriptionProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: 8),
            descriptionProduct.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            descriptionProduct.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
//            descriptionProduct.heightAnchor.constraint(equalToConstant: descriptionProduct.contentSize.height)
//            descriptionProduct.heightAnchor.constraint(equalToConstant: 42)
        ])
    
        
        realLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            realLabel.topAnchor.constraint(equalTo: descriptionProduct.bottomAnchor, constant: 24),
            realLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            realLabel.leadingAnchor.constraint(equalTo: descriptionProduct.leadingAnchor),
            realLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDelete.topAnchor.constraint(equalTo: realLabel.bottomAnchor, constant: 32),
            buttonDelete.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            buttonDelete.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            //            buttonDelete.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16)
        ])
    
        
    }
    
}

extension UIViewController: UITextViewDelegate {
    
}




