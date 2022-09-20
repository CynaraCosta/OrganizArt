//
//  ProductsViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class ProductsViewController: UIViewController {
    
    let productView = ProductsView()
    let Home = HomeViewController()
    
    @objc private func addProduct(){
        let rootVC = AddProductViewController()
        rootVC.view.backgroundColor = UIColor(named: "purple-80")
        rootVC.title = "Adicionar produto"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true)
        
    }
    
    private let buttonPlus: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.setImage(UIImage(named: "plus"), for: .normal)
        buttonPlus.contentMode = .scaleAspectFit
        buttonPlus.tintColor = .label
        buttonPlus.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        return buttonPlus
    }()
    
    private let tableViewShowProducts: UITableView = {
        let tableViewShowProducts = UITableView()
        tableViewShowProducts.register(ShowProductsCell.self, forCellReuseIdentifier: ShowProductsCell.identifier)
        tableViewShowProducts.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableViewShowProducts.allowsSelection = true
        tableViewShowProducts.isUserInteractionEnabled = true
        return tableViewShowProducts
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = productView
        
        self.view.addSubview(buttonPlus)
        self.view.addSubview(tableViewShowProducts)
    
        
        tableViewShowProducts.dataSource = self
        tableViewShowProducts.delegate = self
        tableViewShowProducts.backgroundColor = .clear
        
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlus.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonPlus.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
        ])
        
        tableViewShowProducts.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewShowProducts.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            tableViewShowProducts.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 56),
            tableViewShowProducts.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            tableViewShowProducts.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16)
        ])
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewShowProducts.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


