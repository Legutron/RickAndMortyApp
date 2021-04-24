//
//  EpisodesViewController.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    let data = DataHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        test()
    }
    
    func test(){
        do{
            if let episodes = try data.getEpisodes(){
                for (index, episode) in episodes.enumerated(){
                    print("\(index): episode name: \(episode.name), episode number: \(episode.episode)")
                }
            }
        }catch{
            
        }
    }

}
