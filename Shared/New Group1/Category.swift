//
//  Category.swift
//  Artable
//
//  Created by Edgar Escorza on 6/25/19.
//  Copyright © 2019 Edgar Escorza. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    var name: String
    var id: String
    var imgUrl: String
    var isActive: Bool = true
    var timeStamp: Timestamp
}
