//
//  CharacterViewController.swift
//  RaM
//
//  Created by Jakub Legut on 31/03/2021.
//

import UIKit

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var characterTableView: UITableView!
    
    var pageIteration = 0
    var data = DataHandler()
    var characters = [CharacterResults]()
    var connection = false
    var info: Info?
    
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
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    private func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    

}
