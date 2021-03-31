//
//  CoreEpisodes+CoreDataProperties.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//
//

import Foundation
import CoreData


extension CoreEpisodes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreEpisodes> {
        return NSFetchRequest<CoreEpisodes>(entityName: "CoreEpisodes")
    }

    @NSManaged public var airDate: String?
    @NSManaged public var created: String?
    @NSManaged public var episode: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var url: String?

}

extension CoreEpisodes : Identifiable {

}
