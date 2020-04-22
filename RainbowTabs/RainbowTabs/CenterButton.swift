//
//  CenterButton.swift
//  RainbowTabs
//
//  Created by Aaron Chen on 2020-04-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class CenterButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(){
        self.init(frame: .zero)
        self.setTitle("Go!", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
