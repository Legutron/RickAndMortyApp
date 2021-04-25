//
//  EpisodeDetailsVCTable.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import UIKit

extension EpisodeDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell") as! EpisodeDetailsCell
        cell.name.text = characters[indexPath.row].name
        cell.avatar.image = data.getAvatar(url: characters[indexPath.row].image)
        return cell
        
    }
    
}
