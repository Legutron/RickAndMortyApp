//
//  coreHandler.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//

import Foundation
import UIKit
import CoreData

class CoreHandler{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let api = ApiHandler()
    
}

// MARK: - CHARACTERS

extension CoreHandler{
    
    func saveCharacters(characters: [CharacterResults]) throws{
        print("save Characters")
        if let charId = try charactersId(){
            print(charId)
            print("char ID in CoreHandler")
        
            for char in characters{
                
                if charId.count == 0{
                    try addCharacter(character: char)
                }else if !charId.contains(Int64(char.id)){
                    try addCharacter(character: char)
                }
            }
        }
    }
    
    func saveFavorite(id: Int64) throws{
        let favorites = try getFavorites()
        if !favorites.contains(id){
            try addFavorite(id: id)
        }
    }
    
    
    func getCharacters() throws -> [CharacterResults]{
        print("character coreData")
        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let data = try self.context.fetch(request)
        var characters = [CharacterResults]()

        for char in data{
            let character = CharacterResults(id: Int(char.id), name: char.name!, status: char.status!, species: char.species!, type: char.type!, gender: char.gender!, origin: Origin(name: char.originName!, url: char.originUrl!), location: Location(name: char.locationName!, url: char.locationUrl!), image: URL(string: char.image!), episode: [], url: URL(string: char.url!), created: char.created!)
            print(char.id)

            characters.append(character)
        }
        return characters
    }
    
    func getFiltredCharacters(status: String) throws -> [CharacterResults]{
    
        print("character coreData")
        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let format = "status CONTAINS '\(status)'"
        let pred = NSPredicate(format: format)
        request.predicate = pred
        let data = try self.context.fetch(request)
        var characters = [CharacterResults]()
    
        for char in data{
            let character = CharacterResults(id: Int(char.id), name: char.name!, status: char.status!, species: char.species!, type: char.type!, gender: char.gender!, origin: Origin(name: char.originName!, url: char.originUrl!), location: Location(name: char.locationName!, url: char.locationUrl!), image: URL(string: char.image!), episode: [], url: URL(string: char.url!), created: char.created!)
                print(char.id)
    
            characters.append(character)
        }
        return characters
    }
    
    func getFavorites() throws -> [Int64]{
        let request = CoreFavorites.fetchRequest() as NSFetchRequest<CoreFavorites>
        let data = try self.context.fetch(request)
        var favorites: [Int64] = []

        for fav in data{
            favorites.append(fav.id)
        }
        return favorites
    }
    
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
    
    func addFavorite(id: Int64) throws{
        let newFav = CoreFavorites(context: context)
        newFav.id = id
        self.context.insert(newFav)
        try self.context.save()
    }
    


    func addCharacter(character: CharacterResults) throws {

        print("add character")
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


            print("saved in coreData: \(character.name)")
            self.context.insert(newCharacter)
            try self.context.save()
    }
}

//MARK:- EPISODES

extension CoreHandler{
    
    func saveEpisodes(episodes: [EpisodeResults]) throws{
        print("save Episodes")
    
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
    
    func addEpisode(episode: EpisodeResults) throws{
    
        let newEpisode = CoreEpisodes(context: context)
        newEpisode.id = Int64(episode.id)
        newEpisode.name = episode.name
        newEpisode.airDate = episode.air_date
        newEpisode.url = episode.url.absoluteString
        newEpisode.created = episode.created
    
        print("saved in coreData: \(String(describing: episode.url))")
        self.context.insert(newEpisode)
        try self.context.save()
    }
    
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
    
    func getEpisode() throws -> [EpisodeResults]{
        print("episodes coreData")
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
    
    
    
//
//    func setRelationship(character: Character, episodesURL: [URL]) throws{
//        var episodes = [EpisodeResults]()
//
//        for epi in episodesURL{
//            if let episode = try api.pullEpisode(url: epi){
//                episodes.append(episode)
//            }
//        }
//
//        let request = Episode.fetchRequest() as NSFetchRequest<Episode>
//        let data = try self.context.fetch(request)
//
//        for result in data{
//            for epi in episodes{
//                if epi.id == result.id{
//                    result.epiCharacter = character
//                    try self.context.save()
//                }
//            }
//        }
//    }
//

//

//

//




//
//    private func fetchLastEpisode() throws -> Int64?{
//
//        let request = Episode.fetchRequest() as NSFetchRequest<Episode>
//        let sort = NSSortDescriptor(key: "id", ascending: false)
//
//        request.sortDescriptors = [sort]
//        request.fetchLimit = 1
//
//        let episode = try self.context.fetch(request)
//
//        if episode.count != 0{
//            return episode[0].id
//        }else{
//            return nil
//        }
//    }
//



extension CoreHandler{
    
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
    
    private func charactersId() throws -> [Int64]?{

        let request = CoreCharacters.fetchRequest() as NSFetchRequest<CoreCharacters>
        let sort = NSSortDescriptor(key: "id", ascending: false)

        request.sortDescriptors = [sort]
        //request.fetchLimit = 1

        let character = try self.context.fetch(request)
        
        var array: [Int64] = []
        for char in character{
            array.append(char.id)
        }
        return array
    }
    
    
    
    
    
}
