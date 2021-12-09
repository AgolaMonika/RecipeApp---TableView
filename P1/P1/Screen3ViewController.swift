//
//  Screen3ViewController.swift
//  P1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen3ViewController: UIViewController {
    
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
       
        label.numberOfLines = 10
        return label
    }()
    private let myLable:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 20)
        label.text = "abc"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let s2 = TableView()
        s2.dismiss(animated: true)
        view.addSubview(myImageView)
        view.addSubview(myData)
        view.addSubview(myLable)
     
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x:0, y: 100, width: view.width-20, height: 300)
        myLable.frame = CGRect(x: 120, y: 20, width: 200, height: 100)
        myData.frame = CGRect(x: 20, y: 250 ,width: view.width-20, height: 500)
        if let mytitle = UserDefaults.standard.string(forKey: "Topic"){
            myLable.text = mytitle
            myImageView.image = UIImage(named: mytitle)
            myData.text = "The flavor of your food is what most customers focus on when they are deciding what to eat. How you present the dishes on your menu can help build anticipation, and a good menu description could even convince a hesitant customer to try something new. With this in mind, it's important to be precise and thorough when choosing words to describe your food's flavor."
        }
        else{
        myLable.text = "Pizza"
        myImageView.image = UIImage(named: "Pizza")
        myData.text = "The flavor of your food is what most customers focus on when they are deciding what to eat. How you present the dishes on your menu can help build anticipation, and a good menu description could even convince a hesitant customer to try something new. With this in mind, it's important to be precise and thorough when choosing words to describe your food's flavor."
        }
    }
       
    }
    

   


