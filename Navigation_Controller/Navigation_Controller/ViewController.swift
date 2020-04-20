//
//  ViewController.swift
//  Navigation_Controller
//
//  Created by Aaron Chen on 2020-04-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

struct User{
    let name: String
    let hobby: String
}

class ViewController: UIViewController {

    @IBOutlet var hobbyTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /**this method gets called right before the segu happens*/
        if let id = segue.identifier, id == "Red" {
            if let des = segue.destination as? RedViewController{
                let name = nameTextField.text!
                let hobby = hobbyTextField.text!
                let user = User(name: name, hobby: hobby)
                des.user = user
                
                /**this line will crash because that outlet in this time still 'nil' so never access outlet in this time*/
                //des.userInfoLabel.text = "test"
            }
        }
    }
    
    @IBAction func unwindToBlue(unwindSegue: UIStoryboardSegue){
        print("Poped")
    }
}

