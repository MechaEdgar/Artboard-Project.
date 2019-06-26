//
//  CategoryCell.swift
//  Artable
//
//  Created by Edgar Escorza on 6/25/19.
//  Copyright © 2019 Edgar Escorza. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius =  5
    }

    func configureCell(category: Category) {
        categoryLbl.text = category.name
        if let url = URL(string: category.imgUrl){
            categoryImg.kf.setImage(with: url)
        }
    }
}
