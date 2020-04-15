//
//  ViewController.swift
//  AutoLayout
//
//  Created by Aaron Chen on 2020-04-15.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let btn = UIButton()
        btn.setTitle("My button", for: .normal)
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        let w = view.bounds.size.width / 3
        
        let btn1 = UIButton()
        btn1.setTitle("Your button", for: .normal)
        btn1.backgroundColor = .blue
        btn1.translatesAutoresizingMaskIntoConstraints = false
        btn1.widthAnchor.constraint(equalToConstant: w).isActive = true
        
        let vStackView = UIStackView(arrangedSubviews: [btn, btn1])
        
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.alignment = .center
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.spacing = 30
        view.addSubview(vStackView)
        
        vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //        view.addSubview(btn)
        //        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180).isActive = true
        //        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        //        btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -180).isActive = true
        //        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true
        
    }
}

