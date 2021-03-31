//
//  CoreFavorites+CoreDataProperties.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//
//

import Foundation
import CoreData


extension CoreFavorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreFavorites> {
        return NSFetchRequest<CoreFavorites>(entityName: "CoreFavorites")
    }

    @NSManaged public var id: Int64

}

extension CoreFavorites : Identifiable {

}
