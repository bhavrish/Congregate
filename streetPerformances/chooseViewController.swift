//
//  chooseViewController.swift
//  streetPerformances
//
//  Created by Bhavesh Shah on 4/6/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit

class chooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRegularUser(_ sender: Any) {
        performSegue(withIdentifier: "userRegisterSegue", sender: nil)
    }
    
    @IBAction func onPerformer(_ sender: Any) {
        performSegue(withIdentifier: "performerRegisterSegue", sender: nil)
    }
    
}
