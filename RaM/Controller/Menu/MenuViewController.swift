//
//  ViewController.swift
//  RaM
//
//  Created by Jakub Legut on 30/03/2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    var activityView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func characterBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toCharacter", sender: nil)
    }
    
    @IBAction func favoritesBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toFavorites", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        showActivityIndicator()
    }
    
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        activityView?.color = UIColor(named: "appYellow") ?? UIColor.yellow
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }

}

