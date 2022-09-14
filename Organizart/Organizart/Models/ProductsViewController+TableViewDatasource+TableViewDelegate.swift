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
