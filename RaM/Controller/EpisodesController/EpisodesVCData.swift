//
//  EpisodesVCData.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation

extension EpisodesViewController{
    
    func loadInfo(){
        do{
            if let info = try data.getEpisodeInfo(){
                self.info = info

                connection = true
            }else{
                connection = false
            }
        }catch{
            
        }
    }

    
    func loadData(){
        if connection == true{
            do{
                for i in 1...info!.pages{
                    if let data = try data.getEpisodes(iteration: i){
                        episodes += data
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        print(episodes)
    }
    
    func filtrEpisode(value: String) -> [EpisodeResults]{
        var result: [EpisodeResults] = []
        for episode in episodes{
            if episode.episode.contains(value){
                result.append(episode)
            }
        }
        return result
    }
    
}
