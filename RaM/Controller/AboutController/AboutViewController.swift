//
//  AboutViewController.swift
//  RaM
//
//  Created by Jakub Legut on 20/04/2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
    
    @IBAction func fbTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.facebook.com/jakub.legut/"){
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func ytTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.youtube.com/channel/UChow6BPy5F60psKvKQ3xW-w"){
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func inTapped(_ sender: Any) {
        if let url = NSURL(string: "https://www.linkedin.com/in/jakub-legut/"){
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func gitTapped(_ sender: Any) {
        if let url = NSURL(string: "https://github.com/Legutron"){
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }

}
