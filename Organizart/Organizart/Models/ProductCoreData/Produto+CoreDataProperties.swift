//
//  Produto+CoreDataProperties.swift
//  Organizart
//
//  Created by Cynara Costa on 13/09/22.
//
//

import Foundation
import CoreData


extension Produto_CoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Produto_CoreData> {
        return NSFetchRequest<Produto_CoreData>(entityName: "Produto_CoreData")
    }

    @NSManaged public var title: String?
    @NSManaged public var description_: String?
    @NSManaged public var price: Float
    @NSManaged public var stock: Int32
    @NSManaged public var picture: String?

}

extension Produto_CoreData : Identifiable {

}
