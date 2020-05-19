//
//  HeaderView.swift
//  CollectionView
//
//  Created by Aaron Chen on 2020-05-19.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let textLabel:UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        textLabel.text = "This is my header view!"
        addSubview(textLabel)
        textLabel.matchParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
