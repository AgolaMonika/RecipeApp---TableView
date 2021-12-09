//
//  CtyCell.swift
//  P1
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CtyCell: UITableViewCell {
    private let myImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 40
        return imageview
    }()
    
    private let myLable:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 28)
        return label
    }()
    
    func setUpCityCellWidth(title name: String){
        contentView.addSubview(myImageView)
        contentView.addSubview(myLable)
        
        myImageView.frame = CGRect(x: 20, y: 20, width: 80, height: 80)
        myLable.frame = CGRect(x: myImageView.right + 20, y: 20, width: 200, height: 80)
    
        myImageView.image = UIImage(named : name)
        myLable.text = name
    }

    
}
