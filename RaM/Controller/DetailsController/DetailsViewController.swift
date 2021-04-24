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
    
    var data = DataHandler()
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        loadAvatar()
        setFavButton()
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
            createdLabel.text = character!.created.toFormatedDate()
        }
    }
    
    private func loadAvatar(){
        if character != nil{
            avatarImage.image = data.getAvatar(url: character?.image)
        }
    }
    
    private func setFavButton(){
        if data.isItFavorite(id: Int64(character!.id)){
            favButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        }else{
            favButton.setBackgroundImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
    }

    @IBAction func favButtonPressed(_ sender: Any) {
        do{
            if data.isItFavorite(id: Int64(character!.id)){
                try data.deleteFavorites(id: Int64(character!.id))
            }else{
                try data.saveFavorites(id: Int64(character!.id))
                setFavButton()
            }
        }catch{
            print(error.localizedDescription)
        }
        setFavButton()
    }
    
}
