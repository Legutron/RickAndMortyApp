//
//  CharacterViewControlerTableView.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import Foundation
import UIKit

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterDetail" {
            let destVC = segue.destination as! DetailsViewController
            destVC.character = choosedCharacter
        }else{
        }
    }
    
    func reloadTableData(){
        characterTableView.reloadData()
        if characters.count > (pageIteration-1) * 20{
            //hideActivityIndicator()
        }
    }
    
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
            
            if connection{
                if pageIteration < info!.pages{
                    //showActivityIndicator()
                    pageIteration += 1
                    loadCharacters()
                    reloadTableData()
                    //hideActivityIndicator()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosedCharacter = characters[indexPath.row]
        self.performSegue(withIdentifier: "toCharacterDetail", sender: nil)
    }
    

    
    
    
    
    
}
