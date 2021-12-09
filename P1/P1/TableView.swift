//
//  TableView.swift
//  P1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TableView: UIViewController {

    private let myTableView = UITableView()
    private let breakfastdata = ["Burger","Pizza","Sandwiche"]
    private let data = ["A hamburger (or burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties","pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese","A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Table view"
        view.addSubview(myTableView)
        setupTable()
        myTableView.rowHeight = 200.0
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        print("hello")
        myTableView.frame=CGRect(x: 0,
                                 y : view.top,
                                 width : view.width,
                                 height:  view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    
    }

}
extension TableView: UITableViewDelegate,UITableViewDataSource{
    private func setupTable(){
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breakfastdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! CustomCellTableViewCell
        cell.setupCustomCell(title: breakfastdata[indexPath.row], x:data[indexPath.row] )
        //cell.backgroundColor = .red
        //cell.frame.height = 100
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        clickdata(a:breakfastdata[indexPath.row])
    }
    func clickdata(a: String){
        UserDefaults.standard.setValue(a, forKey: "Topic")
        self.dismiss(animated: true)
        let s2 = Screen3ViewController()
        navigationController?.pushViewController(s2, animated: true)
        present(s2,animated:  true)
        
    }
    
    
}
