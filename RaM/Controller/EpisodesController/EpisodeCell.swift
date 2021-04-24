//
//  EpisodeCell.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation
import UIKit

class EpisodeCell: UITableViewCell{
    
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {

        if selected {
            view.backgroundColor = UIColor(named: "appYellow")?.withAlphaComponent(0.7) ?? UIColor.gray.withAlphaComponent(0.7)
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
}
