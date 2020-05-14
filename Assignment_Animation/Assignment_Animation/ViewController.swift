//
//  ViewController.swift
//  Assignment_Animation
//
//  Created by Aaron Chen on 2020-05-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

// MARK: - If it is Done add "//" in front
// TODO: - The height of a Nav Bar is 88 points (For iPhone X 88 pts, otherwise 44 pts) set different height for different device

class ViewController: UIViewController {
    let stackView = UIStackView()
    let customNavigationBar = UIView()
    let tableView = SnacksTableViewController()
    let addButton = UIButton(type: .system)
    let foodsStackView = UIStackView()
    let titleLable = UILabel()
    var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**Add all view first*/
        view.addSubview(stackView)
        customNavigationBar.addSubview(addButton)
        customNavigationBar.addSubview(foodsStackView)
        customNavigationBar.addSubview(titleLable)
        stackView.addArrangedSubview(customNavigationBar)
        stackView.addArrangedSubview(tableView.tableView)
        
        /**staackView Setting*/
        stackView.matchParent()
        stackView.axis = .vertical
        
        /**customNavigationBar Setting*/
        customNavigationBar.backgroundColor = .init(white: 0.86, alpha: 1)
        customNavigationBar.anchors(topAnchor: stackView.topAnchor, leadingAnchor: stackView.leadingAnchor, trailingAnchor: stackView.trailingAnchor, bottomAnchor: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 88))
        
        /**add Button Setting*/
        addButton.setTitle("＋", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 40)
        addButton.addTarget(self, action: #selector(addSnacks), for: .touchUpInside)
        addButton.anchors(topAnchor: customNavigationBar.topAnchor, leadingAnchor: nil, trailingAnchor: customNavigationBar.trailingAnchor, bottomAnchor: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 16), size: .init(width: 50, height: 50))
        
        /**foodStackView Setting*/
        foodsStackView.axis = .horizontal
        /**top is 82 because addButton have top 32 and height 50 so set foodStackView top 82*/
        foodsStackView.matchParent(padding: .init(top: 82, left: 5, bottom: 5, right: 5))
        foodsStackView.distribution = .fillEqually
        foodsStackView.isHidden = true
        foodsStackView.spacing = 5
        
        /**add images to foodsStackView*/
        let images = [
        imageSourceAndName(source: "oreos", name: "Oreos"),
        imageSourceAndName(source: "pizza_pockets", name: "Pockets"),
        imageSourceAndName(source: "pop_tarts", name: "Pop Tarts"),
        imageSourceAndName(source: "popsicle", name: "Popsicle"),
        imageSourceAndName(source: "ramen", name: "Ramen"),
        ]
        
        for image in images{
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            let imageView = UIImageViewWithName(image: .init(imageLiteralResourceName: image.source))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            imageView.name = image.name
            foodsStackView.addArrangedSubview(imageView)
        }
        
        /**titleLable Setting*/
        titleLable.text = "SNACKS"
        titleLable.textColor = .black
        titleLable.font = .boldSystemFont(ofSize: 18)
        titleLable.centerXYin(customNavigationBar)
    }
    
    
    @objc func addSnacks(){
        openAnimate()
        isOpen.toggle()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageViewWithName
        tableView.addSnack(snack: tappedImage.name!)
    }
    
    func openAnimate() {
        if isOpen {
            /**"If is open close it*/
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                /**Change height */
                self.customNavigationBar.constraints.filter({ $0.firstAttribute == .height }).first!.constant = 88
                self.titleLable.constraintsAffectingLayout(for: .vertical).filter({ $0.firstAttribute == .centerY }).first!.constant = 0
                self.view.layoutIfNeeded()
                self.addButton.transform = .identity
                self.titleLable.text = "SNACKS"
                self.foodsStackView.isHidden = true
            }, completion: nil)
            
        }else{
            /**if isn't open open it*/
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                /**Change height */
                self.customNavigationBar.constraints.filter({ $0.firstAttribute == .height }).first!.constant = 200
                self.titleLable.constraintsAffectingLayout(for: .vertical).filter({ $0.firstAttribute == .centerY }).first!.constant = -40
                self.view.layoutIfNeeded()
                let rotationTransform = CGAffineTransform(rotationAngle: .pi/4)
                self.addButton.transform = rotationTransform
                self.titleLable.text = "Add a SNACKS"
                self.foodsStackView.isHidden = false
            }, completion: nil)
        }
    }
}

