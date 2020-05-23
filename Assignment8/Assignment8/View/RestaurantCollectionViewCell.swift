//
//  RestaurantCollectionViewCell.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    var restaurant : Restaurant!
    var restaurantImage : UIImageView!
    var restauranNameLable : UILabel!
    var restauranCategories : UILabel!
    var restauranReview : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        restaurantImage = UIImageView()
        restauranNameLable = UILabel()
        restauranCategories = UILabel()
        restauranReview = UILabel()
        
        contentView.addSubview(restaurantImage)
        contentView.addSubview(restauranNameLable)
        contentView.addSubview(restauranCategories)
        contentView.addSubview(restauranReview)
        
        restaurantImage.layer.masksToBounds = true
        restauranNameLable.font = UIFont.boldSystemFont(ofSize: 18)
        restauranNameLable.numberOfLines = 0
        restauranCategories.font = UIFont.systemFont(ofSize: 18)
        restauranReview.font = UIFont.systemFont(ofSize: 18)
        
        restauranCategories.anchors(topAnchor: nil, leadingAnchor: contentView.leadingAnchor, trailingAnchor: contentView.trailingAnchor, bottomAnchor: contentView.bottomAnchor,padding: UIEdgeInsets(top: 0, left: 3, bottom: 3, right: 3))
        
        restauranNameLable.anchors(topAnchor: nil, leadingAnchor: contentView.leadingAnchor, trailingAnchor: contentView.trailingAnchor, bottomAnchor: restauranCategories.topAnchor,padding: UIEdgeInsets(top: 0, left: 3, bottom: 3, right: 3))
        
        restauranReview.anchors(topAnchor: nil, leadingAnchor: nil, trailingAnchor: contentView.trailingAnchor, bottomAnchor: restauranNameLable.topAnchor,padding: UIEdgeInsets(top: 0, left: 0, bottom: 3, right: 3))
        
        restaurantImage.anchors(topAnchor: contentView.topAnchor, leadingAnchor: contentView.leadingAnchor, trailingAnchor: contentView.trailingAnchor, bottomAnchor: restauranNameLable.topAnchor,padding: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
