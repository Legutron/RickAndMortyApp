//
//  CharacterViewControlerTableView.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import Foundation
import UIKit

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharactersCell
        cell.nameLabel.text = characters[indexPath.row].name
        cell.genderLabel.text = characters[indexPath.row].gender
        cell.speciesLabel.text = characters[indexPath.row].species
        cell.statusLabel.text = characters[indexPath.row].status
        cell.idLabel.text = String(characters[indexPath.row].id)
        cell.avatar.image = loadAvatar(url: characters[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 1{
            
            
            
//            if connection == true && statusControl.selectedSegmentIndex == 0{
//                let spinner = UIActivityIndicatorView(style: .gray)
//
//                if page == maxPage{
//                    spinner.startAnimating()
//                    spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(10))
//                }else{
//                    spinner.stopAnimating()
//                    page += 1
//                    loadData(page: page)
//                }
//            }
        }
    }
    

    
    
    
    
    
}
