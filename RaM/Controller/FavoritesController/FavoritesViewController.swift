//
//  FavoritesViewController.swift
//  RaM
//
//  Created by Jakub Legut on 20/04/2021.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var characterTableView: UITableView!
    
    var data = DataHandler()
    var characters = [CharacterResults]()
    var choosedCharacter: CharacterResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterTableView.delegate = self
        characterTableView.dataSource = self
        loadFavoritesData()
    }
    
}
