//
//  ViewController.swift
//  Animation
//
//  Created by Aaron Chen on 2020-05-12.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        example5()
    }
    
    func example(){
        let squre = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        squre.backgroundColor = .purple
        view.addSubview(squre)
        UIView.animate(withDuration: 3.0){
            squre.backgroundColor = .orange
        }
    }
    
    func example2(){
        let squre = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        squre.backgroundColor = .purple
        view.addSubview(squre)
        UIView.animate(withDuration: 3.0){
            squre.backgroundColor = .orange
            squre.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100, width: 200, height: 200)
        }
    }
    
    // MARK: - Make the square view larger and move it to the center of the view, and then move back to the original position
    func example3(){
        let originalFrame = CGRect(x: 0, y: 44, width: 100, height: 100)
        let squre = UIView(frame: originalFrame)
        squre.backgroundColor = .purple
        view.addSubview(squre)
        
        UIView.animate(withDuration: 3.0, animations: {
            squre.backgroundColor = .orange
            squre.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100, width: 200, height: 200)
        }, completion: {(_) in
            UIView.animate(withDuration: 3.0){
                      squre.backgroundColor = .purple
                      squre.frame = originalFrame
                  }
        })
    }
    
    func example4(){
        let squre = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        squre.backgroundColor = .purple
        squre.alpha = 0
        view.addSubview(squre)
        UIView.animate(withDuration: 3.0,delay: 2.0, options: [.repeat], animations: {
            squre.backgroundColor = .orange
            squre.frame = .init(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100, width: 200, height: 200)
            squre.alpha = 1
        }, completion: nil)
    }

    // MARK: - CGAffineTransfrom
    func example5(){
        let squre = UIView(frame: .init(x: 0, y: 44, width: 100, height: 100))
        squre.backgroundColor = .purple
        view.addSubview(squre)
        
        UIView.animate(withDuration: 2.0, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            let rotationTransform = CGAffineTransform(rotationAngle: .pi)
            let translateTransform = CGAffineTransform(translationX: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 100)
            squre.transform = scaleTransform.concatenating(rotationTransform).concatenating(translateTransform)
            
        }, completion: {(_) in
            UIView.animate(withDuration: 2.0, animations: {
                squre.transform = .identity
            })
        })
    }
    
}

