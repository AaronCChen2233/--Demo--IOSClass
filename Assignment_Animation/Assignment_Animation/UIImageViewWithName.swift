//
//  UIImageViewWithName.swift
//  Assignment_Animation
//
//  Created by Aaron Chen on 2020-05-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

struct imageSourceAndName {
    let source:String
    let name:String
}

// MARK: - This is a normal UIImageView but it allow you save a name
class UIImageViewWithName: UIImageView {
    var name:String?
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
