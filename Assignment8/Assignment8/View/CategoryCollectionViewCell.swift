//
//  CategoryCollectionViewCell.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    var categoryLable : UILabel!
    var category : RestaurantsCategories!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryLable.backgroundColor = self.tintColor
                categoryLable.textColor = .white
            }else{
                categoryLable.backgroundColor = .white
                categoryLable.textColor = self.tintColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        categoryLable = UILabel()
        categoryLable.textColor = self.tintColor
        categoryLable.font = UIFont.systemFont(ofSize: 20)
        contentView.addSubview(categoryLable)
        categoryLable.matchParent()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
