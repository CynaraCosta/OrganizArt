//
//  AddProductViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit
import SwiftUI

class AddProductViewController: UIViewController {
    
    @objc private func back(){
        dismiss(animated: true)
        // tem que colocar o pop up aqui
    }
    
    @objc private func save(){
        // do something at the core data
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "purple-700")

        
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
}
