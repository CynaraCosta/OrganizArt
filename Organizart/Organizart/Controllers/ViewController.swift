//
//  ViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 12/09/22.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .systemBackground
        let Images = ["house", "bag", "shippingbox"]
        
        let homeVC = HomeViewController()
        homeVC.title = "Início"
        let salesVC = SalesViewController()
        salesVC.title = "Vendas"
        let productsVC = ProductsViewController()
        productsVC.title = "Produtos"
        
        self.setViewControllers([homeVC, salesVC, productsVC], animated: false)
        guard let items = self.tabBar.items else {return}
        
        for vc in (0...Images.count - 1) {
            items[vc].image = UIImage(systemName: Images[vc])
        }
        
        self.tabBar.tintColor = UIColor(named: "purple-700")
        self.tabBar.unselectedItemTintColor = UIColor(named: "purple-500")
        
    }
    
    
}


