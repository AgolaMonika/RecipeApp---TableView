//
//  SearchVCViewController.swift
//  P1
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SearchVCViewController: UIViewController {
    private let stateArray = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu"];
    
    private var searchData = [String()]
    private let myTableView = UITableView()
    private let mySearchBar = UISearchBar()
    private var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTableView);
        view.addSubview(mySearchBar);
        setupTableView()
        mySearchBar.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mySearchBar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        myTableView.frame = CGRect(x: 0, y: mySearchBar.bottom, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-50)
    }

}
extension SearchVCViewController: UITableViewDataSource,UITableViewDelegate{
    private func setupTableView(){
        myTableView.dataSource = self
        myTableView.delegate   = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "StateCall")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchData.count
        }
        else{
            return stateArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCall",for: indexPath)
        if searching{
        cell.textLabel?.text = searchData[indexPath.row]
        }
        else{
        cell.textLabel?.text = stateArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var title = ""
        if searching{
            title = searchData[indexPath.row]
        }
        else{
            title = stateArray[indexPath.row]
        }
        let alert = UIAlertController  (title: title, message: "welcome to \(title)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
}
extension SearchVCViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            searching = false
        }
        else{
            searching = true
            searchData = stateArray.filter({$0.lowercased().hasPrefix(searchText.lowercased())})
        }
        myTableView.reloadData()
    }
}
