//
//  HeaderCell.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateCell(_ dataModel:UserDataModel) {
        categoryImage.layer.cornerRadius = categoryImage.frame.size.height/2
        if let imageString = dataModel.image{
            if let imageUrl = URL(string: imageString){
                categoryImage.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "placeholder"))
            }
        }
        if let titleText = dataModel.name{
            titleLabel.text = titleText
        }
    }
}
