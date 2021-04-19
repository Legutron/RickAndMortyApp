//
//  DetailsViewController.swift
//  RaM
//
//  Created by Jakub Legut on 19/04/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var character: CharacterResults?
    var avatar: UIImage?
    
    var api = DataHandler()
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        loadAvatar()
    }
    
    private func setLabels(){
        if character != nil{
            idLabel.text = String(character!.id)
            statusLabel.text = character!.status
            speciesLabel.text = character!.species
            typeLabel.text = character!.type
            genderLabel.text = character!.gender
            originLabel.text = character!.origin.name
            locationLabel.text = character!.location.name
            createdLabel.text = character!.created
        }
    }
    
    private func loadAvatar(){
        if character != nil{
            avatarImage.image = api.getAvatar(url: character?.image)
        }
    }

}
