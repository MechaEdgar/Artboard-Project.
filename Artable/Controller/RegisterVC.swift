//
//  RegisterVC.swift
//  Artable
//
//  Created by Edgar Escorza on 6/14/19.
//  Copyright © 2019 Edgar Escorza. All rights reserved.
//

import UIKit
import Firebase
class RegisterVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTXT: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resgisterClicked(_ sender: Any) {
        print("button pressed")
        guard let email = emailTxt.text , !email.isEmpty,
            let username = usernameTXT.text , !username.isEmpty,
            let password = passwordTxt.text , password.isEmpty else { return }
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            print("succesfully registered new user")
        }

    }
    
}
