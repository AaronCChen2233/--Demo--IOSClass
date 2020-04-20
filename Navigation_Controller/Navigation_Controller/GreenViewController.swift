//
//  GreenViewController.swift
//  Navigation_Controller
//
//  Created by Aaron Chen on 2020-04-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            switch id {
                
                
            case "GoToPurple":
                print("Go To Purple")
            case "GoToOrange":
                print("Go To Orange")
            default:
                print("Error")
            }
        }
    }
    
    @IBAction func purpleButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToPurple", sender: sender)
    }
    @IBAction func orangeButtonTapped(_ sender: UIButton) {
                performSegue(withIdentifier: "GoToOrange", sender: sender)
    }
}
