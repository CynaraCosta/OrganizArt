//
//  Sale.swift
//  Organizart
//
//  Created by mccl on 12/09/22.
//

import Foundation

struct Sale {
    var clientName: String? = nil
    let saleFormat: String
    let productsChosen: [ProductSold]
    let id: Int
    let totalPrice: Float
}
