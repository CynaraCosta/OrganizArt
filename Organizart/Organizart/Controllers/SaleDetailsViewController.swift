//
//  SaleDetailsViewController.swift
//  Organizart
//
//  Created by mccl on 16/09/22.
//

import UIKit

class SaleDetailsViewController: UIViewController {
    
    public var sale: Sale = Sale(clientName: "", saleFormat: "", productsChosen: [], id: 0, totalPrice: 0)
    
    @objc private func back(){
            dismiss(animated: true)
        }
    
    public var orderIdLabel: UILabel = {
        var orderIdLabel = UILabel()
        orderIdLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
//        orderIdLabel.backgroundColor = .brown
        orderIdLabel.textColor = .label
        orderIdLabel.text = "#014"
        
        
        return orderIdLabel
        
    }()
    
    public var dateLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
//        date.backgroundColor = .systemRed
        date.text = "20/09/2022"
        
        return date
        
    }()
    
    public var clientNameLabel: UILabel = {
        var name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        name.numberOfLines = 0
        name.textColor = .label
        name.text = "Cynara Valéria de Oliveira Costa do Amaral Cavalcanti"

        
        return name
        
    }()
    
    public var saleFormatLabel: UILabel = {
        var saleFormatLabel = UILabel()
        saleFormatLabel.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        saleFormatLabel.textColor = .label
//        saleFormatLabel.backgroundColor = .yellow
        saleFormatLabel.text = "Feira Bom Jesus"
        saleFormatLabel.numberOfLines = 0
        saleFormatLabel.textAlignment = .center
        saleFormatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return saleFormatLabel
        
    }()
    
    public var totalPrice: UILabel = {
        var price = UILabel()
        price.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        price.textColor = .label
        price.text = "R$600,00"
        
        return price
        
    }()
    
    public var totalLabel: UILabel = {
        var total = UILabel()
        total.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        total.textColor = .label
        total.text = "Total"
        
        return total
        
    }()
    
    private var buttonDelete: UIButton = {
            let buttonDelete = UIButton()
            buttonDelete.setTitle("Excluir venda", for: .normal)
            buttonDelete.titleLabel?.textColor = .label
            buttonDelete.backgroundColor = UIColor(named: "red-700")
            buttonDelete.layer.cornerRadius = 8
            buttonDelete.translatesAutoresizingMaskIntoConstraints = false

            return buttonDelete
        
        }()
    
    public let tagView: UIView = {
        let tagView = UIView()
        tagView.backgroundColor = UIColor(named: "purple-100")
        tagView.layer.cornerRadius = 6
        tagView.layer.masksToBounds = true
        
        return tagView
        
    }()
    
    var firstStackView: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
//        stack.backgroundColor = .yellow
        stack.spacing = 195
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    var secondStackView: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .center
        stack.axis = .horizontal
//        stack.backgroundColor = .blue
        stack.spacing = 50
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    var priceStackView: UIStackView = {
        var stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
//        stack.backgroundColor = .blue
        stack.spacing = 160
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    
    
    func hierarchy() {
        self.view.addSubview(firstStackView)
        self.view.addSubview(secondStackView)
        self.view.addSubview(priceStackView)
        self.view.addSubview(buttonDelete)
        
        firstStackView.addArrangedSubview(orderIdLabel)
        firstStackView.addArrangedSubview(dateLabel)
        
        secondStackView.addArrangedSubview(clientNameLabel)
        secondStackView.addArrangedSubview(tagView)
        
        tagView.addSubview(saleFormatLabel)
        
        priceStackView.addArrangedSubview(totalLabel)
        priceStackView.addArrangedSubview(totalPrice)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 96),
            firstStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            firstStackView.widthAnchor.constraint(equalToConstant: 326),

            
            secondStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128),
            secondStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            secondStackView.widthAnchor.constraint(equalToConstant: 326),
            
            saleFormatLabel.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 2),
            saleFormatLabel.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -2),
            saleFormatLabel.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 13),
            saleFormatLabel.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -13),
            
            tagView.widthAnchor.constraint(equalToConstant: 80),
            //modificar isso para ser de acordo com o tamanho da label
            
            priceStackView.topAnchor.constraint(equalTo: productsChosenTableView.bottomAnchor, constant: 24),
            priceStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            priceStackView.widthAnchor.constraint(equalToConstant: 326),
            
            buttonDelete.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 32),
            buttonDelete.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            buttonDelete.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),

        
        
        ])
        
        
    }
    
    let detailsView = SaleDetailsView()
    var productsChosenTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(productsChosenTableView)
        self.view.backgroundColor = .systemBackground
        
        self.view.insetsLayoutMarginsFromSafeArea = true
        
        hierarchy()
        setupConstraints()
        configureTableView()
        
        setupInfo()
        
        title = "Detalhe de venda"
        
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 32, width: view.frame.size.width, height: 44))
                navBar.backgroundColor = .clear
                
                view.addSubview(navBar)

            let navItem = UINavigationItem(title: "#\(sale.id)")
                
                let backItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: nil, action: #selector(back))
                let backItem2 = UIBarButtonItem(title: "Voltar", style: .done, target: nil, action: #selector(back))

                let editItem = UIBarButtonItem(title: "Editar", style: .done, target: nil, action: #selector(back))

                
                editItem.tintColor = UIColor(named: "purple-700")
                backItem.tintColor = UIColor(named: "purple-700")
                backItem2.tintColor = UIColor(named: "purple-700")
                
                navItem.rightBarButtonItem = editItem
                navItem.leftBarButtonItems = [backItem, backItem2]

                navBar.setItems([navItem], animated: false)
              

    }
    
    func configureTableView() {
        setTableViewDelegates()
        productsChosenTableView.rowHeight = UITableView.automaticDimension
        productsChosenTableView.separatorStyle = .none
        productsChosenTableView.backgroundColor = .clear
        productsChosenTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        productsChosenTableView.allowsSelection = true
        productsChosenTableView.isUserInteractionEnabled = true
        productsChosenTableView.register(ProductsChosenTableViewCell.self, forCellReuseIdentifier: "ProductsChosenTableViewCell")
        
        
        productsChosenTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsChosenTableView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 24),
            productsChosenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            productsChosenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            productsChosenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450)
        ])
    }
    
    func setTableViewDelegates() {
        productsChosenTableView.delegate = self
        productsChosenTableView.dataSource = self

    }
    
    func setupInfo() {
        clientNameLabel.text = sale.clientName
        saleFormatLabel.text = sale.saleFormat
        orderIdLabel.text = "#\(sale.id)"
        totalPrice.text = "R$\(sale.totalPrice)"
        
        
        
    }
    
}

extension SaleDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sale.productsChosen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsChosenTableViewCell") as? ProductsChosenTableViewCell else {return UITableViewCell()}
        let products = sale.productsChosen[indexPath.row]
        cell.set(product: products)
        cell.layer.cornerRadius = 8

        
        return cell
    }
    
    
}
