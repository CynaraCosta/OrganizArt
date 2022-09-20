//
//  SaleDetailsViewController.swift
//  Organizart
//
//  Created by mccl on 16/09/22.
//

import UIKit

class SaleDetailsViewController: UIViewController {
    
    public var sale: Sale = Sale(clientName: "", saleFormat: "", productsChosen: [], id: 0, totalPrice: 0)
    
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
            firstStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32),
            firstStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            firstStackView.widthAnchor.constraint(equalToConstant: 326),

            
            secondStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
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
        
        
        ])
        
        
    }
    
    let detailsView = SaleDetailsView()
    var productsChosenTableView = UITableView()
    
    
    @objc private func back(){
        dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(productsChosenTableView)
        self.view.backgroundColor = .systemBackground
        hierarchy()
        setupConstraints()
        configureTableView()
        
        setupInfo()
        
        title = "Detalhe de venda"
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
    }
    
    func configureTableView() {
        setTableViewDelegates()
        productsChosenTableView.rowHeight = UITableView.automaticDimension
        productsChosenTableView.separatorStyle = .none
//        productsChosenTableView.backgroundColor = .clear
        productsChosenTableView.backgroundColor = .brown
        productsChosenTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        productsChosenTableView.allowsSelection = true
        productsChosenTableView.isUserInteractionEnabled = true
        productsChosenTableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "ProductsChosenTableViewCell")
        
        
        productsChosenTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsChosenTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            productsChosenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            productsChosenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
//            productsChosenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        print(products)
        cell.set(product: products)
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true

        
        return cell
    }
    
    
}
