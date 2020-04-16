//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let orangeL:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 238/255, green: 135/255, blue: 63/255, alpha: 1)
        return view
    }()
    
    let orangeR:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 238/255, green: 135/255, blue: 63/255, alpha: 1)
        return view
    }()
    
    let red:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 233/255, green: 63/255, blue: 55/255, alpha: 1)
        return view
    }()
    
    let purple:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    let blueT:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let blueC:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let blueB:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
        setmainView()
    }
    
    fileprivate func setmainView(){
        mainView.addSubview(purple)
        mainView.addSubview(red)
        mainView.addSubview(blueT)
        mainView.addSubview(blueC)
        mainView.addSubview(blueB)
        
        red.addSubview(orangeL)
        red.addSubview(orangeR)
        red.widthAnchor.constraint(equalToConstant: 220).isActive = true
        red.heightAnchor.constraint(equalToConstant: 60).isActive = true
        red.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        red.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        
        orangeL.topAnchor.constraint(equalTo: red.topAnchor, constant: 10).isActive = true
        orangeL.leadingAnchor.constraint(equalTo: red.leadingAnchor, constant: 10).isActive = true
        orangeL.bottomAnchor.constraint(equalTo: red.bottomAnchor, constant: -10).isActive = true
        
        orangeR.topAnchor.constraint(equalTo: red.topAnchor, constant: 10).isActive = true
        orangeR.leadingAnchor.constraint(equalTo: red.leadingAnchor, constant: 140).isActive = true
        orangeR.bottomAnchor.constraint(equalTo: red.bottomAnchor, constant: -10).isActive = true
        
        orangeL.widthAnchor.constraint(equalToConstant: 120).isActive = true
        orangeL.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        orangeR.widthAnchor.constraint(equalToConstant: 70).isActive = true
        orangeR.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        purple.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        purple.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        purple.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
        purple.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blueT.widthAnchor.constraint(equalToConstant: 80).isActive = true
        blueT.heightAnchor.constraint(equalToConstant: 80).isActive = true
        blueT.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        blueT.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50).isActive = true
        
        blueC.widthAnchor.constraint(equalTo: blueT.widthAnchor).isActive = true
        blueC.heightAnchor.constraint(equalTo: blueT.heightAnchor).isActive = true
        blueC.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        blueC.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        
        blueB.widthAnchor.constraint(equalTo: blueT.widthAnchor).isActive = true
        blueB.heightAnchor.constraint(equalTo: blueT.heightAnchor).isActive = true
        blueB.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        blueB.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50).isActive = true
        
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

