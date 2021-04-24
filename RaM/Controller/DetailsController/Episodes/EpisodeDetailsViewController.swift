//
//  EpisodeDetailsViewController.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    var episode: EpisodeResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if episode != nil{
            print(episode)
        }
    }
    
    private func setLabels(episode: EpisodeResults){
        
    }

}
