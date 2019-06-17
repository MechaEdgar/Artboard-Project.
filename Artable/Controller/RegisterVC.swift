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
    @IBOutlet weak var passImgCheck: UIImageView!
    @IBOutlet weak var confirmImgCheck: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        guard let passTxt = passwordTxt.text else { return }
        
        // If we have started typing in the confirm pass textfield.
        if textfield == confirmPassTxt {
            passImgCheck.isHidden = false
            confirmImgCheck.isHidden = false
        } else {
            if passTxt.isEmpty {
                passImgCheck.isHidden = true
                confirmImgCheck.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        //Make it so when the passwords match, the checkmars turn green.
        if passwordTxt.text == confirmPassTxt.text {
            passImgCheck.image = UIImage(named: "green_check")
            confirmImgCheck.image = UIImage(named: "green_check")
        } else {
            passImgCheck.image = UIImage(named: "red_check")
            confirmImgCheck.image = UIImage(named: "red_check")
        }
    }
    
    @IBAction func resgisterClicked(_ sender: Any) {
        guard let email = emailTxt.text ,
            let username = usernameTXT.text ,
            let password = passwordTxt.text,
            email.isNotEmpty,
            username.isNotEmpty,
            password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            print("succesfully resgistered new user")
            
        }

    }
    
}
