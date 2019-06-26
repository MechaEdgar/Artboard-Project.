//
//  Extensions.swift
//  Artable
//
//  Created by Edgar Escorza on 6/15/19.
//  Copyright © 2019 Edgar Escorza. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension String {
    
    var isNotEmpty : Bool{
        return !isEmpty
    }
    
}

extension UIViewController {
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

