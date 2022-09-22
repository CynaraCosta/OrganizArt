//
//  TopSalesViewController.swift
//  Organizart
//
//  Created by mccl on 22/09/22.
//

import UIKit

class TopSalesViewController: UIViewController {

    let saleFormatArray = ["Instagram", "Whatsapp", "Fenearte", "Feira de Casa Amarela", "Feira Na Laje", "Feirinha UFPE", "Feirinha do Bom Jesus", "Feira de Casa Forte", "Fenahall", "Feira da Madalena"]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopSalesTableViewCell.self, forCellReuseIdentifier: "TopSalesTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension TopSalesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopSalesTableViewCell", for: indexPath) as? TopSalesTableViewCell else {
            return UITableViewCell()
        }
        let rank = (indexPath.row)+1
        let products = saleFormatArray[indexPath.row]
        cell.set(saleFormat: products, index: rank)
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //size of the table view
    }

}
