//
//  EpisodeDetailsViewController.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    var episode: EpisodeResults?
    let data = DataHandler()
    var characters: [CharacterResults] = []
    
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        
        if episode != nil{
            loadCharacters()
            titleLabel.text = episode!.name
            charactersTableView.reloadData()
        }
    }
    
    private func setLabels(episode: EpisodeResults){
        
    }
    
    private func loadCharacters(){
        do{
            characters = try data.getCharactersFromUrl(url: episode!.characters!)
        }catch{
            print(error.localizedDescription)
        }
    }

}
