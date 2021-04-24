//
//  EpisodeResults.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation

struct EpisodeResults: Codable{

    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: URL
    let created: String

}
