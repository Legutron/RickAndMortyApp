//
//  CharacterViewController.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var characterTableView: UITableView!
    
    var pageIteration = 1
    var data = DataHandler()
    var characters = [CharacterResults]()
    var connection = false
    var info: Info?
    var choosedCharacter: CharacterResults?

    var activityView: UIActivityIndicatorView?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.delegate = self
        characterTableView.dataSource = self
        loadInfo()
        loadCharacters()
    }
    
    private func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        activityView?.color = UIColor(named: "appYellow") ?? UIColor.yellow
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    private func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        var status: String = ""
        
        switch segmentControl.selectedSegmentIndex{
            case 0: status = "all";
            case 1: status = "Alive";
            case 2: status = "Dead";
            case 3: status = "unknown";
        default: loadCharacters();
        }
        
        if status == "all"{ loadCharacters()}else{
            loadFiltredData(status: status)
        }
    }
    
}
