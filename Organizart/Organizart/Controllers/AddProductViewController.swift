//
//  AddProductViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit
import SwiftUI

class AddProductViewController: UIViewController {
    
    @objc private func back(){
        dismiss(animated: true)
        // tem que colocar o pop up aqui
    }
    
    @objc private func save(){
        // do something at the core data
        
        let Home = HomeViewController()
        let stockV = stockValue.text!
        let priceV = inputPrice.text!
        
        if let stock = Int(stockV), let price = Float(priceV) {
            let stockFlex = stock
            let priceFlex = price
            Home.newProduct(title: inputName.text!, description_: inputDescription.text!, price: priceFlex, stock: Int32(stockFlex), picture: "aaaaa")
            labelError.isHidden = true
            dismiss(animated: true)
        } else {
            labelError.isHidden = false
        }
        
        // resolver a questao da foto
        
    }
    
    @objc private func increase(){
        stockValue.text = String(Int(stockValue.text!) ?? 1 + 1)
        stockValue.reloadInputViews()
    }
    
    @objc private func decrease(){
        stockValue.text = String(Int(stockValue.text!) ?? 1 - 1)
        stockValue.reloadInputViews()
    }
    
    @objc private func addPhoto(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private let buttonImage: UIButton = {
        let buttonImage = UIButton()
        buttonImage.layer.cornerRadius = 8
        buttonImage.backgroundColor = .systemBackground
        
        let imageCamera = UIImageView()
        imageCamera.image = UIImage(named: "camera")
        
        let addImageLabel = UILabel()
        addImageLabel.text = "Adicionar foto"
        addImageLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        addImageLabel.textColor = UIColor(named: "purple-700")

        
        buttonImage.addSubview(imageCamera)
        buttonImage.addSubview(addImageLabel)
        
        imageCamera.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            imageCamera.topAnchor.constraint(equalTo: buttonImage.topAnchor, constant: 100),
            imageCamera.centerXAnchor.constraint(equalTo: buttonImage.centerXAnchor),
            imageCamera.topAnchor.constraint(equalTo: buttonImage.topAnchor, constant: 100)
        ])
        
        addImageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addImageLabel.centerXAnchor.constraint(equalTo: buttonImage.centerXAnchor),
            addImageLabel.topAnchor.constraint(equalTo: imageCamera.bottomAnchor, constant: 8)
        ])
        
        buttonImage.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
        
        return buttonImage
    }()
    
    private let imagePhoto: UIImageView = {
        let image = UIImageView()
        image.isHidden = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let buttonPlusP: UIButton = {
        let buttonPlusP = UIButton()
        buttonPlusP.setTitle("+", for: .normal)
        buttonPlusP.layer.cornerRadius = 8
        buttonPlusP.layer.masksToBounds = true
        buttonPlusP.backgroundColor = UIColor(named: "purple-700")
        buttonPlusP.addTarget(AddProductViewController.self, action: #selector(increase), for: .touchUpInside)
        return buttonPlusP
    }()
    
    private let buttonMinusP: UIButton = {
        let buttonMinusP = UIButton()
        buttonMinusP.setTitle("-", for: .normal)
        buttonMinusP.layer.cornerRadius = 8
        buttonMinusP.layer.masksToBounds = true
        buttonMinusP.backgroundColor = UIColor(named: "purple-700")
        buttonMinusP.addTarget(AddProductViewController.self, action: #selector(decrease), for: .touchUpInside)
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
    
    private let inputName:  UITextField = {
        let inputName = UITextField()
        //            inputName.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        inputName.placeholder = "Nome do produto"
        inputName.returnKeyType = .done
        inputName.keyboardType = UIKeyboardType.default
        inputName.layer.cornerRadius = 8
        inputName.backgroundColor = .systemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        inputName.leftView = paddingView
        inputName.leftViewMode = .always
        return inputName
    }()
    
    private let inputDescription:  UITextField = {
        let inputDescription = UITextField()
        //            inputName.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        inputDescription.placeholder = "Descrição do produto"
        inputDescription.returnKeyType = .done
        inputDescription.keyboardType = UIKeyboardType.default
        inputDescription.layer.cornerRadius = 8
        inputDescription.backgroundColor = .systemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        inputDescription.leftView = paddingView
        inputDescription.leftViewMode = .always
        return inputDescription
    }()
    
    private let inputPrice:  UITextField = {
        let inputPrice = UITextField()
        //            inputName.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        inputPrice.placeholder = "Valor do produto"
        inputPrice.returnKeyType = .done
        inputPrice.keyboardType = UIKeyboardType.default
        inputPrice.layer.cornerRadius = 8
        inputPrice.backgroundColor = .systemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        inputPrice.leftView = paddingView
        inputPrice.leftViewMode = .always
        return inputPrice
    }()
    
    private let labelError: UILabel = {
        let labelError = UILabel()
        labelError.isHidden = true
        labelError.text = "Favor colocar um valor numérico para o preço!"
        labelError.textColor = UIColor(named: "red-700")
        labelError.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        labelError.numberOfLines = 2
        labelError.textAlignment = .center
        return labelError
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imagePhoto)
        self.view.addSubview(buttonImage)
        self.view.addSubview(buttonPlusP)
        self.view.addSubview(stockValue)
        self.view.addSubview(buttonMinusP)
        self.view.addSubview(inputName)
        self.view.addSubview(inputDescription)
        self.view.addSubview(inputPrice)
        self.view.addSubview(labelError)
        
        
        
        setupConstraints()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
    }
    
    func setupConstraints(){
        
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            buttonImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 102),
//            buttonImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -102),
            buttonImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonImage.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.5),
            buttonImage.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.3)
        ])
        
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            buttonImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 102),
//            buttonImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -102),
            imagePhoto.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imagePhoto.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.5),
            imagePhoto.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.3)
        ])
        
        
        stockValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockValue.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 16),
            stockValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stockValue.widthAnchor.constraint(equalToConstant: 42),
            stockValue.bottomAnchor.constraint(equalTo: inputName.topAnchor, constant: -16)
            
        ])
        
        buttonPlusP.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlusP.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 16),
            buttonPlusP.trailingAnchor.constraint(equalTo: stockValue.leadingAnchor, constant: -8)
//            buttonPlusP.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        buttonMinusP.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonMinusP.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 16),
            buttonMinusP.leadingAnchor.constraint(equalTo: stockValue.trailingAnchor, constant: 8)
        ])
        
        inputName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            inputName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            inputName.topAnchor.constraint(equalTo: buttonPlusP.bottomAnchor, constant: 16),
            inputName.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        inputDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputDescription.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            inputDescription.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            inputDescription.topAnchor.constraint(equalTo: inputName.bottomAnchor, constant: 8),
            inputDescription.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        inputPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputPrice.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            inputPrice.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            inputPrice.topAnchor.constraint(equalTo: inputDescription.bottomAnchor, constant: 8),
            inputPrice.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        labelError.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            labelError.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelError.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 48),
            labelError.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -48),
            labelError.topAnchor.constraint(equalTo: inputPrice.bottomAnchor, constant: 32)
        ])
        
    }
    
}


extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage {
            buttonImage.isHidden = true
            imagePhoto.image = image
            imagePhoto.isHidden = false
            
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
