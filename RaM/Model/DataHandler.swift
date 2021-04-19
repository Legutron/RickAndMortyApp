//
//  DataHandler().swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

struct DataHandler {
    
    let api = ApiHandler()
    let core = CoreHandler()
    
    
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
    
    func getAvatar(url: URL?) -> UIImage{
        return api.getPicture(url: url)
    }
    
    func getCharInfo() -> Info?{
        do{
           let info = try api.getCharactersInfo()
            return info
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getFiltredData(status: String) throws -> [CharacterResults]?{
        if let characters = try api.getFiltredCharacters(status: status){
            return characters
        }else{
            let characters = try core.getFiltredCharacters(status: status)
            return characters
        }
    }
    
}
