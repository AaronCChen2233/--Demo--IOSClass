//
//  StudentTableViewCell.swift
//  TableViewDemoCode
//
//  Created by Aaron Chen on 2020-05-01.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    let name : UILabel = {
               let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(name)
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    required init?(coder: NSCoder) {
        fatalError("not been implemented")
    }

}
