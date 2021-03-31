//
//  CoreCharacters+CoreDataProperties.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//
//

import Foundation
import CoreData


extension CoreCharacters {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreCharacters> {
        return NSFetchRequest<CoreCharacters>(entityName: "CoreCharacters")
    }

    @NSManaged public var created: String?
    @NSManaged public var gender: String?
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var locationName: String?
    @NSManaged public var locationUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var originName: String?
    @NSManaged public var originUrl: String?
    @NSManaged public var species: String?
    @NSManaged public var status: String?
    @NSManaged public var type: String?
    @NSManaged public var url: String?

}

extension CoreCharacters : Identifiable {

}
