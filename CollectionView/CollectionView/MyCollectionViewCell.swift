//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Aaron Chen on 2020-05-19.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.matchParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
