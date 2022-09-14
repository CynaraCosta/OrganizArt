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
        // print(salesArray)
        self.view = salesView
        self.view.addSubview(tableView)
        configureTableView()
    }
    
    func configureTableView() {
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "SalesTableViewCell")
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension SalesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salesArray.count
        // change to the .count sales array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesTableViewCell") as! SalesTableViewCell
        let sale = salesArray[indexPath.row]
        cell.set(sale: sale)
        
        return cell
    }
    
    
}
