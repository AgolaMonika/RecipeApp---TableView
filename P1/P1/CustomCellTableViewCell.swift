//
//  CustomCellTableViewCell.swift
//  P1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    private let myImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 40
        return imageview
    }()
    
    private let myData:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 28)
        label.font = UIFont(name: "HelveticNeue-UltraLight",size: 20)
        label.numberOfLines = 3
        return label
    }()
    private let myLable:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 20)
        return label
    }()
    
    func setupCustomCell(title name:String, x data:String){
        contentView.addSubview(myImageView)
        contentView.addSubview(myLable)
        contentView.addSubview(myData)
        
        myImageView.frame = CGRect(x: 20, y: 20, width: 120, height: 120)
        myLable.frame = CGRect(x: myImageView.right + 20, y: 20, width: 200, height: 80)
        myData.frame = CGRect(x: myImageView.right + 10, y: 70, width: 200, height: 100)
        
        myImageView.image = UIImage(named: name)
        myLable.text = name
        myData.text = data
    }
    
}
