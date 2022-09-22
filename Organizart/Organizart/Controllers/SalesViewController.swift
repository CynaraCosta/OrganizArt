//
//  SalesViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class SalesViewController: UIViewController {
    
    @objc private func addSale(){
        let rootVC = AddSaleViewController()
        rootVC.view.backgroundColor = UIColor(named: "purple-80")
        rootVC.title = "Adicionar venda"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true)
        
    }

    let salesView = SalesView()
    var tableView = UITableView()
    var salesArray: [Sale] = []
    
    private let buttonPlus: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.setImage(UIImage(named: "plus"), for: .normal)
        buttonPlus.contentMode = .scaleAspectFit
        buttonPlus.tintColor = .label
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.addTarget(self, action: #selector(addSale), for: .touchUpInside)
        
        return buttonPlus
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salesArray = Sale.logSales()
        self.view = salesView
        self.view.addSubview(tableView)
        self.view.addSubview(buttonPlus)
        configureTableView()
    }
    
    func configureTableView() {
        setTableViewDelegates()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "SalesTableViewCell")
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 188),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            buttonPlus.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonPlus.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
                
        ])
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self

    }

}

extension SalesViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return salesArray.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesTableViewCell") as! SalesTableViewCell
        let sale = salesArray[indexPath.row]
        cell.set(sale: sale)
        cell.layer.cornerRadius = 8

        
        return cell
    }
    
//    // Set the spacing between sections
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 2
//        }
//
//        // Make the background color show through
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.clear
//        return headerView
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sale = salesArray[indexPath.row]
        let vc = SaleDetailsViewController()
        vc.sale = sale
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)

//        didTapCell()
        
    }
    
    
    
    
}
