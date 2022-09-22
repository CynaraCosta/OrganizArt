//
//  HomeViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let contentView = UIView()
    
    let salesTableView = UITableView()
    
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    

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
                
//        collectionView.isScrollEnabled = true
//        collectionView.isUserInteractionEnabled = true
//        collectionView.alwaysBounceHorizontal = true
        
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//            layout.itemSize = CGSize(width: 194, height: 234)
//        }
        
        //view.addSubview(collectionView)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        HomeView_.productsCollectionView.dataSource = self
        HomeView_.productsCollectionView.delegate = self
        
        HomeView_.salesTableView.dataSource = self
        HomeView_.salesTableView.delegate = self
//        collectionView.register(HomeProductsCell.self, forCellWithReuseIdentifier: HomeProductsCell.identifier)
        
        print("celula carregou?")
        salesTableView.register(HomeSalesTableViewCell.self, forCellReuseIdentifier: HomeSalesTableViewCell.identifier)
        salesTableView.delegate = self
        salesTableView.dataSource = self
//        salesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()


//        view.addSubview(salesTableView)
//        salesTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            salesTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: -50),
//            salesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            salesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            salesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 50)
//        ])

        

        
        
//        scrollView.addSubview(tableView)
        
        
//
        
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


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeSalesTableViewCell.identifier, for: indexPath)

        return cell
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
    
    func updateTitleProduct(product: Produto_CoreData, newTitle: String){
        product.title = newTitle
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func updateDescriptionProduct(product: Produto_CoreData, newDescription: String){
        product.description_ = newDescription
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func updatePriceProduct(product: Produto_CoreData, newPrice: Float){
        product.price = newPrice
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductsCell.identifier, for: indexPath)
        
        cell.backgroundColor = .black
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 237, height: 286)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
