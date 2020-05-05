//
//  ToDoItemTableViewCell.swift
//  Assignment6_ToDoList
//
//  Created by Aaron Chen on 2020-05-02.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ToDoItemTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18)
        return lb
    }()
    
    let checkedLable: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.text = "✔️"
        return lb
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(with toDoItem: ToDoItem) {
        nameLabel.text = toDoItem.name
        descriptionLabel.text = toDoItem.toDoDescription
        checkedLable.isHidden = !toDoItem.isDone
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let sv = UIStackView()
        let v = UIView()
        v.addSubview(checkedLable)
        v.addSubview(sv)
        contentView.addSubview(v)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        v.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        v.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        v.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        checkedLable.translatesAutoresizingMaskIntoConstraints = false
        checkedLable.topAnchor.constraint(equalTo: v.topAnchor, constant: 0).isActive = true
        checkedLable.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 0).isActive = true
        checkedLable.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0).isActive = true
        checkedLable.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: v.topAnchor, constant: 0).isActive = true
        sv.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 32).isActive = true
        sv.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 0).isActive = true
        sv.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0).isActive = true
        
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.addArrangedSubview(nameLabel)
        sv.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
