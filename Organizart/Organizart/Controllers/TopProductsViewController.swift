//
//  TopProductsViewController.swift
//  Organizart
//
//  Created by Joana Lima on 21/09/22.
//

import UIKit

class TopProductsViewController: UIViewController {
    
    let productsArray = Product.logProducts()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopProductsTableViewCell.self, forCellReuseIdentifier: "TopProductsTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

extension TopProductsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopProductsTableViewCell", for: indexPath) as? TopProductsTableViewCell else {
            return UITableViewCell()
        }
        let rank = (indexPath.row)+1
        let products = productsArray[indexPath.row]
        cell.set(product: products, index: rank)
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //size of the table view
    }
    
}

