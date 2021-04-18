//
//  CharacterCell.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

class CharactersCell: UITableViewCell{
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak private var background: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {

        if selected {
            background.backgroundColor = UIColor(named: "appYellow")?.withAlphaComponent(0.7) ?? UIColor.gray.withAlphaComponent(0.7)
        } else {
            background.backgroundColor = UIColor.white
        }
    }
    
}
