//
//  FavoritesVCData.swift
//  RaM
//
//  Created by Jakub Legut on 20/04/2021.
//

import UIKit


extension FavoritesViewController{
    
    func loadFavoritesData(){
        do{
            characters = try data.getFavortiesCharacter()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func loadAvatar(url: URL?) -> UIImage{
        return data.getAvatar(url: url)
    }

    
}
