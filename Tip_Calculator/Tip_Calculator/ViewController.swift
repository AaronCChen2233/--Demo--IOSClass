//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Aaron Chen on 2020-04-26.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet var tipPercentageSlider: UISlider!
    @IBOutlet var tipAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard(_ recogizer: UITapGestureRecognizer) {
        billAmountTextField.resignFirstResponder()
        tipPercentageTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
      if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        if view.frame.origin.y == 0 {
          view.frame.origin.y -= keyboardSize.height / 2
        }
      }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
      if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        if view.frame.origin.y != 0 {
          view.frame.origin.y = 0
        }
      }
    }
    
    @IBAction func billAmountTextFieldValueChange(_ sender: UITextField) {
        if var billAmount =  Float(sender.text!){
            if billAmount <= 0{
                billAmount = 0
                billAmountTextField.text = String(Int(billAmount))
            }
        }
        calculateTip()
    }
    
    @IBAction func tipPercentageTextFieldValueChange(_ sender: UITextField) {
        if var tipPercentage = Float(sender.text!){
            if tipPercentage > 100{
                tipPercentage = 100
                tipPercentageTextField.text = String(Int(tipPercentage))
            }
            if tipPercentage <= 0{
                tipPercentage = 0
                tipPercentageTextField.text = String(Int(tipPercentage))
            }
            tipPercentageSlider.value = tipPercentage
        }else{
            tipPercentageSlider.value = 0
        }
        calculateTip()
    }
    
    @IBAction func tipPercentageTextFieldSliderValueChange(_ sender: UISlider) {
        tipPercentageTextField.text = String(Int(sender.value))
        sender.value = Float(Int(sender.value))
        calculateTip()
    }
    
    func calculateTip(){
        if let billAmount = Float(billAmountTextField.text!){
            if let tipPercentage = Float(tipPercentageTextField.text!){
                let percentage = (100 + tipPercentage) / 100
                tipAmountLabel.text = String(billAmount * percentage)
            }
        }
    }
}

