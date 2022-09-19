//
//  InvoicingDetailsViewController.swift
//  Organizart
//
//  Created by Cynara Costa on 19/09/22.
//

import UIKit

class InvoicingDetailsViewController: UIViewController {

    @objc private func back(){
        dismiss(animated: true)
    }
    
    // p pegar o valor = datepicker.date
    
    private let initDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = UIColor(named: "purple-700")
        datePicker.backgroundColor = .systemBackground
        return datePicker
    }()
    
    private let lateDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = UIColor(named: "purple-700")
        datePicker.backgroundColor = .systemBackground
        return datePicker
    }()
    
    private let invoicingLabel: UILabel = {
        let invoicingLabel = UILabel()
        invoicingLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        invoicingLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        invoicingLabel.text = "Faturamento"
        invoicingLabel.textColor = .label
        return invoicingLabel
    }()
    
    private let reaisLabel: UILabel = {
        let reaisLabel = UILabel()
        reaisLabel.text = "Valores em reais"
        reaisLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return reaisLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(invoicingLabel)
        self.view.addSubview(initDatePicker)
        self.view.addSubview(lateDatePicker)
        self.view.addSubview(reaisLabel)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "chevron.backward"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "purple-700")
        
        setupConstraints()
    }

    func setupConstraints() {
        invoicingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invoicingLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            invoicingLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32)
        ])
        
        initDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            initDatePicker.topAnchor.constraint(equalTo: invoicingLabel.topAnchor, constant: 48),
            initDatePicker.leadingAnchor.constraint(equalTo: invoicingLabel.leadingAnchor)
        ])
        
        lateDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lateDatePicker.topAnchor.constraint(equalTo: invoicingLabel.topAnchor, constant: 48),
            lateDatePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
        ])
        
        reaisLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reaisLabel.leadingAnchor.constraint(equalTo: invoicingLabel.leadingAnchor),
            reaisLabel.topAnchor.constraint(equalTo: initDatePicker.bottomAnchor, constant: 16)
        ])
        
    }

}
