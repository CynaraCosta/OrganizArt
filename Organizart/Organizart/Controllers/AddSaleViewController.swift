//
//  AddSaleViewController.swift
//  Organizart
//
//  Created by mccl on 21/09/22.
//

import UIKit

class AddSaleViewController: UIViewController {
    
    @objc private func back(){
        dismiss(animated: true)
        // tem que colocar o pop up aqui
    }
    
    @objc private func save(){
        
    }
    
    @objc private func addFormat() {
        saleFormatArray.append(inputNewSaleFormat.text!)
        updateConstraints()
        //        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        tableView.updateConstraints()
        tableView.reloadData()
    }
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var constraintTableView = NSLayoutConstraint()
    
    
    private let clientLabel: UILabel = {
        let client = UILabel()
        client.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        client.textColor = .label
        client.text = "Cliente"
        client.translatesAutoresizingMaskIntoConstraints = false
        
        return client
        
    }()
    
    private let inputName:  UITextField = {
        let inputName = UITextField()
        //            inputName.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        inputName.placeholder = "Nome do cliente"
        inputName.returnKeyType = .done
        inputName.keyboardType = UIKeyboardType.default
        inputName.layer.cornerRadius = 8
        inputName.translatesAutoresizingMaskIntoConstraints = false
        inputName.backgroundColor = .systemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        inputName.leftView = paddingView
        inputName.leftViewMode = .always
        
        return inputName
        
    }()
    
    private let saleFormat: UILabel = {
        let saleFormat = UILabel()
        saleFormat.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        saleFormat.textColor = .label
        saleFormat.text = "Meio de venda"
        saleFormat.translatesAutoresizingMaskIntoConstraints = false
        
        return saleFormat
        
    }()
    
    private let saleFormatExplained: UILabel = {
        let explanation = UILabel()
        explanation.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        explanation.textColor = .systemGray
        explanation.text = "Por onde ocorreu essa venda?"
        explanation.translatesAutoresizingMaskIntoConstraints = false
        
        return explanation
        
    }()
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame.size.height = tableView.contentSize.height
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        
        return tableView
        
    }()
    
    private var productsTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(ProductsAddSaleTableViewCell.self, forCellReuseIdentifier: "ProductsAddSaleTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    private let inputNewSaleFormat: UITextField = {
        let newFormat = UITextField()
        newFormat.placeholder = "Adicionar novo meio de venda"
        newFormat.returnKeyType = .done
        newFormat.keyboardType = UIKeyboardType.default
        newFormat.layer.cornerRadius = 8
        newFormat.translatesAutoresizingMaskIntoConstraints = false
        newFormat.backgroundColor = .systemBackground
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15
                                                       , height: 20))
        newFormat.leftView = paddingView
        newFormat.leftViewMode = .always
        
        return newFormat
        
    }()
    
    private let buttonAddSaleFormat: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.textColor = UIColor(named: "purple-700")
        button.tintColor = UIColor(named: "purple-700")
        button.addTarget(self, action: #selector(addFormat), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let productsLabel: UILabel = {
        let products = UILabel()
        products.text = "Produtos"
        products.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        products.textColor = .label
        products.translatesAutoresizingMaskIntoConstraints = false
        
        return products
    }()
    
    private let productsExplanation: UILabel = {
        let products = UILabel()
        products.text = "Quais produtos foram vendidos?"
        products.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        products.textColor = .systemGray
        products.translatesAutoresizingMaskIntoConstraints = false
        
        
        return products
        
    }()
    
    private let labelTeste: UILabel = {
        let teste = UILabel()
        teste.translatesAutoresizingMaskIntoConstraints = false
        teste.font = UIFont.systemFont(ofSize: 24.0, weight: .regular)
        teste.textColor = .systemRed
        teste.text = "Testando"
        return teste
        
    }()
    
    
    
    
    var saleFormatArray = ["Instagram", "Whatsapp", "Fenearte", "Feira de Casa Amarela", "Feira Na Laje"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupScrollView()
        hierarchy()
        setConstraints()
        configureTableView()
        configureProductsTableView()
        hideKeyboardWhenTappedAround()
        
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        
        self.view.backgroundColor = .systemBackground
        
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemRed
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .yellow
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+2000)
        
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            //            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            //            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            //            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            //            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            //            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //
            contentView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1200)
            
        ])
        
        
    }
    
    func hierarchy() {
        contentView.addSubview(clientLabel)
        contentView.addSubview(inputName)
        
        contentView.addSubview(saleFormat)
        contentView.addSubview(saleFormatExplained)
        contentView.addSubview(tableView)
        contentView.addSubview(inputNewSaleFormat)
        contentView.addSubview(buttonAddSaleFormat)
        
        contentView.addSubview(productsLabel)
        contentView.addSubview(productsExplanation)
        contentView.addSubview(productsTableView)
        //        contentView.addSubview(labelTeste)
        
        
    }
    
    func configureTableView() {
        setTableViewDelegates()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: saleFormatExplained.bottomAnchor, constant: 9),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            tableView.heightAnchor.constraint(equalToConstant: 220)
            //            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -430),
            //            tableView.heightAnchor.constraint(equalToConstant: 220)
            
        ])
        
    }
    
    func configureProductsTableView() {
        setTableViewProductsDelegates()
        productsTableView.rowHeight = UITableView.automaticDimension
        productsTableView.layer.cornerRadius = 8
        productsTableView.allowsSelection = true
        productsTableView.isUserInteractionEnabled = true
        productsTableView.register(ProductsAddSaleTableViewCell.self, forCellReuseIdentifier: "ProductsAddSaleTableViewCell")
        
        NSLayoutConstraint.activate([
            productsTableView.topAnchor.constraint(equalTo: productsExplanation.bottomAnchor, constant: 25),
//            productsTableView.heightAnchor.constraint(equalToConstant: 400),
            productsTableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            productsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            productsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -64)
            //            productsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200)
            
        ])
        
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setTableViewProductsDelegates() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
    }
    
    func updateConstraints() {
        // You should handle UI updates on the main queue, whenever possible
        DispatchQueue.main.async {
            self.constraintTableView.constant = self.tableView.contentSize.height
            self.tableView.layoutIfNeeded()
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            clientLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            clientLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            inputName.topAnchor.constraint(equalTo: clientLabel.bottomAnchor, constant: 9),
            inputName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            inputName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            inputName.heightAnchor.constraint(equalToConstant: 42),
            
            saleFormat.topAnchor.constraint(equalTo: inputName.bottomAnchor, constant: 19),
            saleFormat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            saleFormatExplained.topAnchor.constraint(equalTo: saleFormat.bottomAnchor, constant: 5),
            saleFormatExplained.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            inputNewSaleFormat.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 28),
            inputNewSaleFormat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            inputNewSaleFormat.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            inputNewSaleFormat.heightAnchor.constraint(equalToConstant: 42),
            
            buttonAddSaleFormat.topAnchor.constraint(equalTo: inputNewSaleFormat.bottomAnchor, constant: 10),
            buttonAddSaleFormat.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            buttonAddSaleFormat.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            productsLabel.topAnchor.constraint(equalTo: buttonAddSaleFormat.bottomAnchor, constant: 25),
            productsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            productsExplanation.topAnchor.constraint(equalTo: productsLabel.bottomAnchor, constant: 5),
            productsExplanation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            //            labelTeste.topAnchor.constraint(equalTo: productsExplanation.bottomAnchor, constant: 400),
            //            labelTeste.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            
        ])
        
    }
    
    
    
    
}

extension AddSaleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return saleFormatArray.count
        } else  {
            return Product.logProducts().count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = saleFormatArray[indexPath.row]
            
            return cell
        } else if tableView == productsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsAddSaleTableViewCell") as! ProductsAddSaleTableViewCell
            let product = Product.logProducts()[indexPath.row]
            cell.set(product: product)
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if tableView == self.tableView {
            
            var selectedFilters = [1, 2, 3, 4, 5]
            
            // Did the user tap on a selected filter item? If so, do nothing.
            let selectedFilterRow = selectedFilters[indexPath.row]
            if selectedFilterRow == indexPath.row {
                return
            }
            
            // Remove the checkmark from the previously selected filter item.
            if let previousCell = tableView.cellForRow(at: IndexPath(row: selectedFilterRow, section: indexPath.section)) {
                previousCell.accessoryType = .none
            }
            
            // Mark the newly selected filter item with a checkmark.
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
            }
            
            // Remember this selected filter item.
            selectedFilters[indexPath.section] = indexPath.row
        }
        
    }
    
    
    //        guard let cell = tableView.cellForRow(at: indexPath) else { return }
    //        cell.accessoryType = .checkmark
    
    //        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    //
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
    //    }
    //
    //
    
    
}


