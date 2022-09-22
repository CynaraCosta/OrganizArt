//
//  TopSalesViewController.swift
//  Organizart
//
//  Created by mccl on 22/09/22.
//

import UIKit

class TopSalesViewController: UIViewController {
    
    @objc private func back(){
        dismiss(animated: true)
    }

    let saleFormatArray = ["Instagram", "Whatsapp", "Fenearte", "Feira de Casa Amarela", "Feira Na Laje", "Feirinha UFPE", "Feirinha do Bom Jesus", "Feira de Casa Forte", "Fenahall", "Feira da Madalena"]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopSalesTableViewCell.self, forCellReuseIdentifier: "TopSalesTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        setConstraints()
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0))
        
        let appearence = UINavigationBarAppearance()
        appearence.configureWithTransparentBackground()
        
        navBar.standardAppearance = appearence
        
        let navItem = UINavigationItem(title: "Produtos mais vendidos")
        view.addSubview(navBar)

        let backItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: nil, action: #selector(back))
        let backItem2 = UIBarButtonItem(title: "Voltar", style: .done, target: nil, action: #selector(back))
                
        backItem.tintColor = UIColor(named: "purple-700")
        backItem2.tintColor = UIColor(named: "purple-700")
        
        navItem.leftBarButtonItems = [backItem, backItem2]
        
        navBar.setItems([navItem], animated: false)
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44)
        ])

    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
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
