//
//  ViewController.swift
//  YogaDemo
//
//  Created by Aaron Chen on 2020-05-07.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit
import YogaKit

class ViewController: UIViewController {

    let contenView:UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
            layout.width = 320
            layout.height = 80
        }
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(contenView)
        
        let width = view.bounds.width
        let height = view.bounds.height
        
        view.configureLayout {
            $0.isEnabled = true
            $0.width = YGValue(width)
            $0.height = YGValue(height)
            $0.alignItems = .center
            $0.justifyContent = .center
        }
        
        view.yoga.applyLayout(preservingOrigin: true)
        
        // Do any additional setup after loading the view.
    }


}

