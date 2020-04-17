//
//  ViewController.swift
//  CommoninputControls
//
//  Created by Aaron Chen on 2020-04-17.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textfield: UITextField!
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    
    let moneyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("Money", for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(moneyButton)
        moneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        moneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        moneyButton.addTarget(self,action:  #selector(moneyButtonTapped), for: .touchUpInside)
        
        let tapGesture = UIPanGestureRecognizer(target: self, action: #selector(tapRecognized))
        
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func tapRecognized(_ recognize:UIPanGestureRecognizer){
        
        switch recognize.state{
        case .changed:
            print(recognize.translation(in: view))
        default :
            break
        }
    }
    
    @objc func moneyButtonTapped(_ sender: UIButton) {
        print("Get money")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button tapped")
        if toggle.isOn{
            print("on")
        }else{
            print("off")
        }
        
        print(slider.value)
        print(textfield.text!)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("is on")
        }else{
            print("is off")
        }
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }

    @IBAction func keyboardEditingChange(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func dismisskeyboard(_ sender: UITapGestureRecognizer) {
        textfield.resignFirstResponder()
    }
}

