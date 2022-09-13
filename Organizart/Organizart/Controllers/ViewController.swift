//
//  ViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let loggingProducts = Product.logProducts()
    let logginSales = Sale.logSales()
    
    var productsModel = [Produto_CoreData]()
    
    let HomeView_ = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllProducts()
        self.view = HomeView_
        // Do any additional setup after loading the view.
    }
    
    // CoreData - Products
    
    func getAllProducts(){
        do {
            productsModel = try context.fetch(Produto_CoreData.fetchRequest())
        }
        catch {
            // error
        }
        
    }
    
    func newProduct(title: String, description_: String, price: Float, stock: Int32, picture: String){
        let newProduct = Produto_CoreData(context: context)
        newProduct.title = title
        newProduct.description_ = description_
        newProduct.price = price
        newProduct.stock = stock
        newProduct.picture = picture
        
        do {
            try context.save()
            getAllProducts()
        }
        catch {
            // error
        }
        
    }
    
    func deleteProduct(product: Produto_CoreData){
        context.delete(product)
        
        do {
            try context.save()
        }
        catch {
            // error
        }
        
    }
    
//    func updateProduct(titleProduct: Produto_CoreData){
//
//    }

}

