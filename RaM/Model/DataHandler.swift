//
//  DataHandler().swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import Foundation

struct DataHandler {
    
    let api = ApiHandler()
    let core = CoreHandler()
    
    
    func getCharacters(iteration: Int) throws -> [CharacterResults]?{
        var characters: [CharacterResults]?
        
        characters = try api.pullCharacters(page: iteration)
    
        return characters
    }
    
    
    
    
    
}
