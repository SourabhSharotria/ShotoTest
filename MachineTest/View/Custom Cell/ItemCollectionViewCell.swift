//
//  ItemCollectionViewCell.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import UIKit
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateCell(_ imageData:String?) {
        if let imageString = imageData{
            if let imageUrl = URL(string: imageString){
                itemImageView.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            }
        }
    }
}
