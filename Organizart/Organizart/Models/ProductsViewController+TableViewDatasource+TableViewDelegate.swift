//
//  ProductsViewController+TableViewDatasource+TableViewDelegate.swift
//  Organizart
//
//  Created by Cynara Costa on 14/09/22.
//

import UIKit

extension ProductsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let Home = HomeViewController()
        Home.getAllProducts()
        return Home.productsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = ShowProductsCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ShowProductsCell else {return UITableViewCell()}
        
        Home.getAllProducts()
//        cell.configure(name: Home.productsModel[indexPath.row].title, price: String(Home.productsModel[indexPath.row].price), stock: String(Home.productsModel[indexPath.row].stock), photo: Home.productsModel[indexPath.row].picture!)
        
        cell.configure(name: Home.productsModel[indexPath.row].title, price: String(Home.productsModel[indexPath.row].price), stock: String(Home.productsModel[indexPath.row].stock), photo: Home.productsModel[indexPath.row].picture!)
        
        return cell
    }
    
    
}

extension ProductsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // setar a height
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // setar
    }
    
}
