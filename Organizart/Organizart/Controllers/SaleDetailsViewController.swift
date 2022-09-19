//
//  SaleDetailsViewController.swift
//  Organizart
//
//  Created by mccl on 16/09/22.
//

import UIKit

class SaleDetailsViewController: UIViewController {
    
    @objc private func back(){
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detalhe de venda"
        view.backgroundColor = .systemRed
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
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
