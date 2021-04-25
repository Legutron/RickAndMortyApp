//
//  DataHandler().swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

/// Struct for handling Core Data and Api
struct DataHandler {
    
    let api = ApiHandler()
    let core = CoreHandler()
    
}

// MARK:- CHARACTERS

extension DataHandler{
    
    ///Get characters
    /// - Parameter iteration: which page to download (Api)
    /// - Returns: Characters from api page, in connection failure get from CoreData
    /// - Throws: Core Data error or Api Error
    func getCharacters(iteration: Int) throws -> [CharacterResults]?{
        if let characters = try api.getCharacters(page: iteration){
            try core.saveCharacters(characters: characters)
            return characters
        }else{
            var characters: [CharacterResults]?
            characters = try core.getCharacters()
            return characters
        }
    }
    
    ///Get character avatar
    /// - Parameter url: string url to image
    /// - Returns: UIImage or default picture
    /// - Throws: Api Error
    func getAvatar(url: URL?) -> UIImage{
        return api.getPicture(url: url)
    }
    
    ///Get character information from Api
    /// - Returns: Information in Info
    /// - Throws: Api Error
    func getCharInfo() -> Info?{
        do{
           let info = try api.getCharactersInfo()
            return info
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    ///Get Filtred characters data
    /// - Parameter status: Character status
    /// - Returns: Characters array
    /// - Throws: Core Data error or Api Error
    func getFiltredData(status: String) throws -> [CharacterResults]?{
        if let characters = try api.getFiltredCharacters(status: status){
            return characters
        }else{
            let characters = try core.getFiltredCharacters(status: status)
            return characters
        }
    }

    ///Get character from URL
    /// - Warning: Use only directl url to character
    /// - Parameter url: Character url array
    /// - Returns: Characters Array
    /// - Throws: Api Error
    func getCharactersFromUrl(url: [String]) throws -> [CharacterResults]{
        var result: [CharacterResults] = []
        for link in url{
            let data = try api.getCharactersFromUrl(url: link)
            result.append(contentsOf: data)
        }
        return result
    }
    
}

// MARK:- EPISODES

extension DataHandler{
    
    ///Get Episodes from api or Core Data
    /// - Warning: In connection failure download episodes from CoreData
    /// - Parameter iteration: Iteration for Api page
    /// - Returns: Episode Array
    /// - Throws: Core Data Error or Api Error
    func getEpisodes(iteration: Int = 0) throws -> [EpisodeResults]?{
        if let episodes = try api.getEpisodes(page: iteration){
            try core.saveEpisodes(episodes: episodes)
            return episodes
        }else{
            let episodes = try core.getEpisode()
            return episodes
        }
    }
    
    ///Get Episode informations
    /// - Returns: Informations
    /// - Throws: Api Error
    func getEpisodeInfo() throws -> Info?{
        let data = try api.getEpisodesInfo()
        return data
    }
    
}

// MARK:- FAVORITES

extension DataHandler{
    
    ///Save Favorites characters id
    /// - Parameter id: Character id
    /// - Throws: Core Data error
    func saveFavorites(id: Int64) throws{
        try core.saveFavorite(id: id)
    }
    
    ///Check favorite id
    /// - Parameter id: Character id
    /// - Returns: Boolean
    /// - Throws: Core Data Error
    func isItFavorite(id: Int64) -> Bool{
        do{
            let favorites = try core.getFavorites()
            if favorites.contains(id){
                return true
            }else{
                return false
            }
        }catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    ///Get favorite Characters
    /// - Returns: Characters Array
    /// - Throws: Core Data Error
    func getFavortiesCharacter() throws -> [CharacterResults]{
        let favIds = try core.getFavorites()
        let result = try core.getFavoritesCharacters(list: favIds)
        return result
    }
    
    ///Delete favorite id from Core Data
    /// - Parameter id: Character id
    /// - Throws: Core Data Error
    func deleteFavorites(id: Int64)throws{
        try core.deleteFavorties(id: id)
    }
}
