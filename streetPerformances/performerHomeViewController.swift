//
//  performerHomeViewController.swift
//  streetPerformances
//
//  Created by Bhavesh Shah on 4/6/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class performerHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onMoreInfo(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.gcac.org/performers/performers/signup") as! URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func onMoreInfo2(_ sender: Any) {
        UIApplication.shared.open(URL(string:"http://www.austintexas.gov/news/city-austin-launches-busking-pilot-program") as! URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func onMoreInfo3(_ sender: Any) {
        UIApplication.shared.open(URL(string:"http://theartscommission.org/forartists") as! URL, options: [:], completionHandler: nil)
    }
    
    
}
