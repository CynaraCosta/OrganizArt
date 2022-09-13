//
//  TabBarViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let homeVC = ViewController()
        let productVC = ProductsViewController()
        let salesVC = SalesViewController()
        
        homeVC.title = "Faturamento"
        productVC.title = "Produtos"
        salesVC.title = "Vendas"
        
        self.setViewControllers([homeVC, productVC, salesVC], animated: false)
        // Do any additional setup after loading the view.
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
