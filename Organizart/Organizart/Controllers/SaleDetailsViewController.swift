//
//  SaleDetailsViewController.swift
//  Organizart
//
//  Created by mccl on 16/09/22.
//

import UIKit

class SaleDetailsViewController: UIViewController {
    private let productsArray: [ProductSold]
    
    init(productsArray: [ProductSold]) {
        self.productsArray = productsArray
        
        super.init(nibName: "SaleDetailsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    let detailsView = SaleDetailsView()
    var productsChosenTableView = UITableView()
    
    @objc private func back(){
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailsView
        self.view.addSubview(productsChosenTableView)
        configureTableView()
        
        title = "Detalhe de venda"
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
    }
    
    func configureTableView() {
        setTableViewDelegates()
        productsChosenTableView.rowHeight = UITableView.automaticDimension
        productsChosenTableView.separatorStyle = .none
        productsChosenTableView.backgroundColor = .clear
        productsChosenTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        productsChosenTableView.allowsSelection = true
        productsChosenTableView.isUserInteractionEnabled = true
        productsChosenTableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "ProductsChosenTableViewCell")
        
        
        productsChosenTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsChosenTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            productsChosenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            productsChosenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            productsChosenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTableViewDelegates() {
        productsChosenTableView.delegate = self
        productsChosenTableView.dataSource = self

    }
    
}

extension SaleDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsChosenTableViewCell") as! ProductsChosenTableViewCell
        let products = productsArray[indexPath.row]
        cell.set(product: products)
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true

        
        return cell
    }
    
    
}
