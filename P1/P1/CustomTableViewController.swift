	//
//  CustomTableViewController.swift
//  P1
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

    class CustomTableViewController: UIViewController{
    private let mytableview=UITableView()
    private var cityArray=["Berlin","Moscow","Rio","Tokyo"]
        override func viewDidLoad() {
        super.viewDidLoad()
        title="Custom Table view"
        view.addSubview(mytableview)
        setupTableView()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mytableview.frame=CGRect(x: 0,
                                 y : view.safeAreaInsets.top,
                                 width : view.width,
                                 height : view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
    

    }
    extension CustomTableViewController: UITableViewDataSource , UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cityArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CtyCell", for: indexPath) as! CtyCell
            cell.setUpCityCellWidth(title: cityArray[indexPath.row])
            return cell
        }
        
        
        private func setupTableView(){
            
            mytableview.dataSource = self
            mytableview.delegate = self
            mytableview.register(CtyCell.self, forCellReuseIdentifier: "CtyCell")
            
        }
        
        //func tableView()
    }
    
