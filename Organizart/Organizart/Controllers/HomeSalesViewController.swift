//
//  HomeSalesViewController.swift
//  Organizart
//
//  Created by sofiadinizms on 21/09/22.
//
//
//import UIKit
//
//class HomeSalesViewController: UIViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("celula carregou?")
//        salesTableView.register(HomeSalesTableViewCell.self, forCellReuseIdentifier: HomeSalesTableViewCell.identifier)
//        salesTableView.delegate = self
//        salesTableView.dataSource = self
//        salesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//
//    }
//
//
//}
//
//extension HomeSalesViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeSalesTableViewCell.identifier, for: indexPath)
//
//        return cell
//    }
//}

