//
//  userSignUpViewController.swift
//  streetPerformances
//
//  Created by Bhavesh Shah on 4/6/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class userSignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        if let email = usernameField.text, let pass = passwordField.text {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user,error) in
                
                // Chat that user isn't nil
                if let u = user {
                    self.performSegue(withIdentifier: "userHomeSegue2", sender: nil)
                }
                else {
                    // return error message if doesnt work
                }
            })
            
        }
        
    }
    
}
