//
//  CharacterViewController.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

class CharacterViewController: UIViewController {

    
    var pageIteration = 0
    var data = DataHandler()
    var characters = [CharacterResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        
        characterTableView.delegate = self
        characterTableView.dataSource = self
        
    }
    
    private func loadCharacters(){
        do{
            if let char = try data.getCharacters(iteration: pageIteration){
                characters = char
            }
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    


}
