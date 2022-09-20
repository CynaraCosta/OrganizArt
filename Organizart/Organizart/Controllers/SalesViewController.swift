//
//  SalesViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//

import UIKit

class SalesViewController: UIViewController {

    let salesView = SalesView()
    var tableView = UITableView()
    var salesArray: [Sale] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salesArray = Sale.logSales()
        self.view = salesView
        self.view.addSubview(tableView)
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self

    }
    
//    @objc private func didTapCell() {
//        let rootVC = SaleDetailsViewController(productsArray: salesArray[indexPath.row])
//        rootVC.view.backgroundColor = UIColor(named: "purple-80")
//        rootVC.title = "Detalhes da venda"
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//    }
//

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
