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
    
//    func EpisodesInfo() throws -> Info?{
//        let url = URL(string: episodesUrl)!
//        if let data = try dataFromUrl(url: url){
//            let episodesInfo = try decoder.decode(Info.self, from: data)
//            return episodesInfo
//        }else{
//            return nil
//        }
//    }

    func getCharacters(page: Int) throws -> [CharacterResults]?{
        let page = "/?page=\(page)"
        let url = URL(string: charactersUrl + page)!
        if let data = try dataFromUrl(url: url){
            let CharResult = try decoder.decode(CharacterMain.self, from: data)
            let characters = CharResult.results
            //try dataHandler.saveCharacters(characters: characters)
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
    
//    func pullEpisodes(page: Int) throws -> [EpisodeResults]?{
//        let page = "/?page=\(page)"
//        let url = URL(string: episodesUrl + page)!
//        if let data = try dataFromUrl(url: url){
//            let epiResults = try decoder.decode(Episodes.self, from: data)
//            let episodes = epiResults.results
//            //try dataHandler.saveCharacters(characters: characters)
//            return episodes
//        }else{
//            return nil
//        }
//    }
    
//    func pullEpisode(url: URL) throws -> EpisodeResults?{
//
//        if let data = try dataFromUrl(url: url){
//            let epiResults = try decoder.decode(EpisodeResults.self, from: data)
//            //try dataHandler.saveCharacters(characters: characters)
//            return epiResults
//        }else{
//            return nil
//        }
//    }
    

    
//    func pullFiltredCharacters(status: String) throws -> [CharacterResults]?{
//
//        let page = "/?status=\(status)"
//        let url = URL(string: charactersUrl + page)!
//        print(url)
//        if let data = try dataFromUrl(url: url){
//            let CharResult = try decoder.decode(Characters.self, from: data)
//            let characters = CharResult.results
//            try dataHandler.saveCharacters(characters: characters)
//            return characters
//        }else{
//            return nil
//        }
//    }
}
