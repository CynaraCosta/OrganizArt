//
//  Sale_CoreData+CoreDataProperties.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//
//

import Foundation
import CoreData


extension Sale_CoreData_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sale_CoreData_> {
        return NSFetchRequest<Sale_CoreData_>(entityName: "Sale_CoreData_")
    }

    @NSManaged public var clientName: String?
    @NSManaged public var saleFormat: String?
    @NSManaged public var id: Int16
    @NSManaged public var totalPrice: Float
    @NSManaged public var productsChosen: NSObject?

}

extension Sale_CoreData_ : Identifiable {

}
