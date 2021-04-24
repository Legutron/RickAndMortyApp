//
//  EpisodesViewController.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import UIKit

class EpisodesViewController: UIViewController{
    
    let data = DataHandler()
    var pageIteration = 0
    
    var episodes: [EpisodeResults] = []
    var filtredEpisodes: [EpisodeResults] = []
    var tableData: [EpisodeResults] = []
    
    var connection = false
    var info: Info?
    var seasonPickerData: [String] = ["all"]
    var choosedEpisode: EpisodeResults?
    
    @IBOutlet weak var episodeTableView: UITableView!
    @IBOutlet weak var seasonPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPickerData()
        
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        
        self.seasonPicker.delegate = self
        self.seasonPicker.dataSource = self
        
        loadInfo()
        loadData()
        reloadTableData(data: episodes)
    }
    
    func loadPickerData(){
        for index in 1...5{
            seasonPickerData.append("S0\(index)")
        }
    }
    
    
}
