//
//  HomeViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let loggingProducts = Product.logProducts()
    let logginSales = Sale.logSales()
    
    var productsModel = [Produto_CoreData]()
    
    let HomeView_ = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllProducts()
        self.view = HomeView_
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .green
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        
        
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceHorizontal = true
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 194, height: 234)
        }
        
        //view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeProductsCell.self, forCellWithReuseIdentifier: HomeProductsCell.identifier)
        
        
//        view.addSubview(tableView)
        tableView.register(HomeSalesTableViewCell.self, forCellReuseIdentifier: HomeSalesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        scrollView.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
//            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 400),
//            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -32),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 3)
//        ])
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getAllProducts()
        print(productsModel.count)
//        for product in productsModel {
//            deleteProduct(product: product)
//        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        //let scrollView = UIScrollView(frame: view.bounds)
//        scrollView.backgroundColor = .green
//        view.addSubview(scrollView)
//        scrollView.addSubview(collectionView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true,
//            tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//            tableView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
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
    
//    func updateProduct(titleProduct: Produto_CoreData){
//
//    }

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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductsCell.identifier, for: indexPath)
        
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 237, height: 286)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    
    
    
}
