//
//  EpisodesVCTableView.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation
import UIKit

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEpisodeDetails" {
            let destVC = segue.destination as! EpisodeDetailsViewController
            destVC.episode = choosedEpisode
        }else{
        }
    }
    
    func reloadTableData(data: [EpisodeResults]){
        tableData = data
        episodeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as! EpisodeCell
        
        cell.name.text = tableData[indexPath.row].name
        cell.id.text = String(tableData[indexPath.row].id)
        cell.episode.text = tableData[indexPath.row].episode
        cell.airDate.text = tableData[indexPath.row].air_date
        
        cell.created.text = tableData[indexPath.row].created.toFormatedDate()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosedEpisode = tableData[indexPath.row]
        self.performSegue(withIdentifier: "toEpisodeDetails", sender: nil)
    }
    
}
