//
//  ApiHandler.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//

import Foundation
import UIKit

class ApiHandler{
        
    private let decoder = JSONDecoder()
    
    private let charactersUrl = "https://rickandmortyapi.com/api/character"
    private let locationsUrl = "https://rickandmortyapi.com/api/location"
    private let episodesUrl = "https://rickandmortyapi.com/api/episode"
    
    private func dataFromUrl(url: URL) throws -> Data?{
        if let data = try? Data(contentsOf: url){
            return data
        }else{
            return nil
        }
    }
}

//MARK:- CHARACTERS

extension ApiHandler{
    
    func getCharactersInfo() throws -> Info?{
        let url = URL(string: charactersUrl)!
        if let data = try dataFromUrl(url: url){
            let charResult = try decoder.decode(CharacterMain.self, from: data)
            let info = charResult.info
            return info
        }else{
            return nil
        }
    }
    
    func getCharacters(page: Int) throws -> [CharacterResults]?{
        let page = "/?page=\(page)"
        let url = URL(string: charactersUrl + page)!
        if let data = try dataFromUrl(url: url){
            let CharResult = try decoder.decode(CharacterMain.self, from: data)
            let characters = CharResult.results
            return characters
        }else{
            return nil
        }
    }
    
    func getFiltredCharacters(status: String) throws -> [CharacterResults]?{
        let page = "/?status=\(status)"
        let url = URL(string: charactersUrl + page)!
        if let data = try dataFromUrl(url: url){
            let CharResult = try decoder.decode(CharacterMain.self, from: data)
            let characters = CharResult.results
            return characters
        }else{
            return nil
        }
    }
    
    func getPicture(url: URL?) -> UIImage{
        var image = UIImage(named: "welcome")!
        if url != nil{
            if let data = try? Data(contentsOf: url!){
                image = UIImage(data: data)!
            }
        }
        return image
    }
    
    func getCharactersFromUrl(url: String) throws -> [CharacterResults]{
        
        var characters: [CharacterResults] = []
                
        if let url = URL(string: url){
            if let data = try? Data(contentsOf: url){
                let character = try decoder.decode(CharacterResults.self, from: data)
                characters.append(character)
            }
        }
        return characters
    }
    
}

//MARK:- EPISODES

extension ApiHandler{
    
    func getEpisodesInfo() throws -> Info?{
            let url = URL(string: episodesUrl)!
            if let data = try dataFromUrl(url: url){
            let episodesInfo = try decoder.decode(EpisodeMain.self, from: data)
            let info = episodesInfo.info
            return info
        }else{
            return nil
        }
    }

    func getEpisodes(page: Int) throws -> [EpisodeResults]?{
        let page = "/?page=\(page)"
        let url = URL(string: episodesUrl + page)!
        if let data = try dataFromUrl(url: url){
            let epiResults = try decoder.decode(EpisodeMain.self, from: data)
            let episodes = epiResults.results
            //try dataHandler.saveCharacters(characters: characters)
            return episodes
        }else{
            return nil
        }
    }

}
