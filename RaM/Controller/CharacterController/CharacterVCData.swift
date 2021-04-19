//
//  CharacterVCData.swift
//  RaM
//
//  Created by Jakub Legut on 18/04/2021.
//

import UIKit

extension CharacterViewController{
    
    
    func loadCharacters(){
        do{
            if let char = try data.getCharacters(iteration: pageIteration){
                characters += char
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func loadAvatar(url: URL?) -> UIImage{
        return data.getAvatar(url: url)
    }
    
    func loadInfo(){
        info = data.getCharInfo()
        if info == nil {
            connection = false
        }else{
            connection = true
        }
    }
    
    func loadFiltredData(status: String){
        do{
            characters = try data.getFiltredData(status: status) ?? []
            reloadTableData()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
}

