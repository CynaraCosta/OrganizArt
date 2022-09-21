//
//  HomeViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class HomeViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let loggingProducts = Product.logProducts()
    let logginSales = Sale.logSales()
    
    var productsModel = [Produto_CoreData]()
    var salesModel = [Sale_CoreData_]()
    
    @objc private func clickedCardI(){
        let rootVC = InvoicingDetailsViewController()
        rootVC.view.backgroundColor = .systemBackground
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    let HomeView_ = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllProducts()
        self.view = HomeView_
        let cardI = HomeView_.card
        
        cardI.addTarget(self, action: #selector(clickedCardI), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAllProducts()
//        for product in productsModel {
//            deleteProduct(product: product)
//        }

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
            productsModel.append(newProduct)
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
    
    func updateStockProduct(product: Produto_CoreData, newStock: Int32){
        product.stock = newStock
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    // CoreData - Sales

    func getAllSales(){
        do {
            salesModel = try context.fetch(Sale_CoreData_.fetchRequest())
        }
        catch {
            // error
        }
        
    }
    
    func newSale(clientName: String, saleFormat: String, id: Int16, totalPrice: Float, productsChosen: [Produto_CoreData]){
        let newSale = Sale_CoreData_(context: context)
        newSale.clientName = clientName
        newSale.saleFormat = saleFormat
        newSale.id = id
        newSale.totalPrice = totalPrice
        newSale.productsChosen = productsChosen as NSObject
        
        do {
            try context.save()
            salesModel.append(newSale)
            getAllSales()
        }
        catch {
            // error
        }
        
    }
    
    func deleteSale(sale: Sale_CoreData_){
        context.delete(sale)
        
        do {
            try context.save()
        }
        catch {
            // error
        }
        
    }
    
}
