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
        
        let homeVC = HomeViewController()
        homeVC.title = "Início"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let salesVC = SalesViewController()
        salesVC.title = "Vendas"
        salesVC.tabBarItem.image = UIImage(systemName: "bag")
        salesVC.tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        
        let productsVC = ProductsViewController()
        productsVC.title = "Produtos"
        productsVC.tabBarItem.image = UIImage(systemName: "shippingbox")
        productsVC.tabBarItem.selectedImage = UIImage(systemName: "shippingbox.fill")
        
        self.setViewControllers([homeVC, salesVC, productsVC], animated: false)
        
        self.tabBar.tintColor = UIColor(named: "purple-700")
        self.tabBar.unselectedItemTintColor = UIColor(named: "purple-500")
        
    }
    
    
}


