//
//  ProductsViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class ProductsViewController: UIViewController {
    
    let productView = ProductsView()
    
    private let buttonPlus: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.setImage(UIImage(named: "plus"), for: .normal)
        buttonPlus.contentMode = .scaleAspectFit
        buttonPlus.tintColor = .label
        buttonPlus.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        return buttonPlus
    }()
    
    @objc private func addProduct(){
        let rootVC = AddProductViewController()
        rootVC.view.backgroundColor = UIColor(named: "purple-80")
        rootVC.title = "Adicionar produto"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = productView
        self.view.addSubview(buttonPlus)
        
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlus.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonPlus.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
        ])
        
        
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
