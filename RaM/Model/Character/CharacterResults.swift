//
//  CharacterResults.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//

import Foundation

struct CharacterResults: Codable{
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: URL?
    let episode: [URL?]
    let url: URL?
    let created: String
    
}

struct Origin: Codable{
    let name: String
    let url: String
}

struct Location: Codable{
    let name: String
    let url: String
}
