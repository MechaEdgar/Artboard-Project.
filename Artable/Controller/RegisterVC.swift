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
            passImgCheck.image = UIImage(named: AppImages.GreenCheck)
            confirmImgCheck.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passImgCheck.image = UIImage(named: AppImages.RedCheck)
            confirmImgCheck.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func resgisterClicked(_ sender: Any) {
        guard let email = emailTxt.text ,
            let username = usernameTXT.text ,
            let password = passwordTxt.text,
            email.isNotEmpty,
            username.isNotEmpty,
            password.isNotEmpty else {
                simpleAlert(title: "Error", msg: "Please fill out all fields.")
                return
        }
        
        guard let confirmPass = confirmPassTxt.text, confirmPass == password else {
            simpleAlert(title: "Error", msg: "Passwords do not match")
            return
        }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else {
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.link(with: credential) { (result, error) in
            if let error = error {
                debugPrint(error)
                self.handleFireAuthError(error: error)
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
