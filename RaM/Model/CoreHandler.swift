//
//  coreHandler.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//

import Foundation
import UIKit
import CoreData

/// Class for handling Core Data
class CoreHandler{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let api = ApiHandler()
    
}

// MARK: - CHARACTERS

extension CoreHandler{
    
    ///Saving characters
    /// - Parameter characters: Characters Array
    /// - Throws: Core Data error
    func saveCharacters(characters: [CharacterResults]) throws{
        if let charId = try charactersId(){

            for char in characters{
                
                if charId.count == 0{
                    try addCharacter(character: char)
                }else if !charId.contains(Int64(char.id)){
                    try addCharacter(character: char)
                }
            }
        }
    }
    
    ///This method get data from api, but on problem pull data from Core Data
    /// - Throws: Core Data error
    func getCharacters() throws -> [CharacterResults]{
        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let data = try self.context.fetch(request)
        var characters = [CharacterResults]()

        for char in data{
            let character = CharacterResults(id: Int(char.id), name: char.name!, status: char.status!, species: char.species!, type: char.type!, gender: char.gender!, origin: Origin(name: char.originName!, url: char.originUrl!), location: Location(name: char.locationName!, url: char.locationUrl!), image: URL(string: char.image!), episode: [], url: URL(string: char.url!), created: char.created!)
            characters.append(character)
        }
        return characters
    }
    
    ///Method for getting filtred data by status
    /// - Parameter status: should be: alive, unknown, dead...
    /// - Throws: Core Error
    func getFiltredCharacters(status: String) throws -> [CharacterResults]{

        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let format = "status CONTAINS '\(status)'"
        let pred = NSPredicate(format: format)
        request.predicate = pred
        let data = try self.context.fetch(request)
        var characters = [CharacterResults]()
    
        for char in data{
            let character = CharacterResults(id: Int(char.id), name: char.name!, status: char.status!, species: char.species!, type: char.type!, gender: char.gender!, origin: Origin(name: char.originName!, url: char.originUrl!), location: Location(name: char.locationName!, url: char.locationUrl!), image: URL(string: char.image!), episode: [], url: URL(string: char.url!), created: char.created!)
    
            characters.append(character)
        }
        return characters
    }
    
    ///Adding (one) new Character to Core Data
    /// - Parameter character: CharacterResults
    /// - Throws: Core Data Error
    func addCharacter(character: CharacterResults) throws {

        let newCharacter = CoreCharacters(context: context)
        newCharacter.id = Int64(character.id)
        newCharacter.name = character.name
        newCharacter.status = character.status
        newCharacter.species = character.species
        newCharacter.type = character.type
        newCharacter.gender = character.gender
        newCharacter.originName = character.origin.name
        newCharacter.originUrl = character.origin.url
        newCharacter.locationName = character.location.name
        newCharacter.locationUrl = character.location.url
        newCharacter.image = character.image?.absoluteString
        newCharacter.url = character.url?.absoluteString
        newCharacter.created = character.created

        self.context.insert(newCharacter)
        try self.context.save()
    }
    
    /// Get last Character in Core Data
    /// - Returns: Character last id in optional Int64
    /// - Throws: Core Data Error
    private func lastCharacter() throws -> Int64?{

        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let sort = NSSortDescriptor(key: "id", ascending: false)

        request.sortDescriptors = [sort]
        request.fetchLimit = 1

        let character = try self.context.fetch(request)

        if character.count != 0{
            return character[0].id
        }else{
            return nil
        }
    }
    
    /// Getting all characters id
    ///  - Returns: Characters id Int64
    /// - Throws: Core Data Error
    private func charactersId() throws -> [Int64]?{

        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let sort = NSSortDescriptor(key: "id", ascending: false)

        request.sortDescriptors = [sort]
        let character = try self.context.fetch(request)
        
        var array: [Int64] = []
        for char in character{
            array.append(char.id)
        }
        return array
    }
}

//MARK:- EPISODES

extension CoreHandler{
    
    /// Saving episodes array
    /// - Parameter episodes: Episodes Array to save
    /// - Throws: Core Data Error
    func saveEpisodes(episodes: [EpisodeResults]) throws{
    
        for epi in episodes{
            let epiIds = try getEpisodesId()
            if epiIds == nil{
                try addEpisode(episode: epi)
            }else{
                if ((epiIds?.contains(Int64(epi.id))) != nil){ print("episode extists")} else{
                    try addEpisode(episode: epi)
                }
            }
        }
    }
    /// Adding one episode
    /// - Parameter episode: One EpisodeResult
    /// - Throws: Core Data Error
    func addEpisode(episode: EpisodeResults) throws{
    
        let newEpisode = CoreEpisodes(context: context)
        newEpisode.id = Int64(episode.id)
        newEpisode.name = episode.name
        newEpisode.airDate = episode.air_date
        newEpisode.url = episode.url.absoluteString
        newEpisode.created = episode.created

        self.context.insert(newEpisode)
        try self.context.save()
    }
    
    /// Getting episode Ids
    ///  - Returns: Optional Array [Int64] with episodes id
    /// - Throws: Core Data Error
    private func getEpisodesId() throws -> [Int64]?{
    
        let request = CoreEpisodes.fetchRequest() as NSFetchRequest<CoreEpisodes>
        let sort = NSSortDescriptor(key: "id", ascending: false)
    
        request.sortDescriptors = [sort]
    
        let episode = try self.context.fetch(request)
        var epiId = [Int64]()
    
        if episode.count != 0{
            for epi in episode{
                epiId.append(epi.id)
            }
            return epiId
        }else{
            return nil
        }
    }
    
    ///Getting Episode array
    /// - Returns: Episodes Array
    /// - Throws: Core Data Error
    func getEpisode() throws -> [EpisodeResults]{
        let request = CoreEpisodes.fetchRequest() as NSFetchRequest<CoreEpisodes>
        let data = try self.context.fetch(request)
        var episodes: [EpisodeResults] = []
        
        for episode in data{
            let epi = EpisodeResults(id: Int(episode.id), name: episode.name!, air_date: episode.airDate!, episode: episode.episode!, characters: nil, url: URL(string: episode.url!)!, created: episode.created!)
            episodes.append(epi)
        }
        
        return episodes
    }
    
}

// MARK: - FAVORITES
extension CoreHandler{
    
    /// Save favorite character to Core Data
    /// - Throws: Core Data Error
    func saveFavorite(id: Int64) throws{
        let favorites = try getFavorites()
        if !favorites.contains(id){
            try addFavorite(id: id)
        }
    }
    
    /// Get favorites characters id
    ///  - Returns: Array of favorite character ids
    /// - Throws: Core Data Error
    func getFavorites() throws -> [Int64]{
        let request = CoreFavorites.fetchRequest() as NSFetchRequest<CoreFavorites>
        let data = try self.context.fetch(request)
        var favorites: [Int64] = []

        for fav in data{
            favorites.append(fav.id)
        }
        return favorites
    }
    
    /// Get favorites characters
    /// - Throws: Core Data Error
    func getFavoritesCharacters(list: [Int64]) throws -> [CharacterResults]{
        let characters = try getCharacters()
        var result: [CharacterResults] = []
        for char in characters{
            if list.contains(Int64(char.id)){
                result.append(char)
            }
        }
        return result
    }
    
    /// Delate favorites character id from data
    /// - Throws: Core Data Error
    func deleteFavorties(id: Int64) throws{
        let request = CoreFavorites.fetchRequest() as NSFetchRequest<CoreFavorites>
        let format = "id CONTAINS '\(id)'"
        let pred = NSPredicate(format: format)
        request.predicate = pred
        let data = try self.context.fetch(request)
        for object in data {
            context.delete(object)
        }
    }
    
    /// Add favorite character id to Core Data
    /// - Throws: Core Data Error
    func addFavorite(id: Int64) throws{
        let newFav = CoreFavorites(context: context)
        newFav.id = id
        self.context.insert(newFav)
        try self.context.save()
    }
}
