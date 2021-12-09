//
//  LoginScreen.swift
//  P1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        
        return textField
    }()
    private var passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton();
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func login(){
        print("Button Click")
        if(nameTextField.text == "Admin" && passTextField.text == "Admin"){
            let s1 = TableView()
             self.dismiss(animated: true)
            navigationController?.pushViewController(s1, animated: true)
            present(s1,animated: true, completion: nil)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Backgroung")!)
        view.addSubview(nameTextField)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Backgroung.png") ?
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: 225, width: view.width - 80, height: 40)
        passTextField.frame = CGRect(x: 40 ,y: 275, width: view.width - 80, height: 40)
        loginButton.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
