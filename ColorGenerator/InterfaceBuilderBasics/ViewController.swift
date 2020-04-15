//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Aaron Chen on 2020-04-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorNameLable: UILabel!
    @IBOutlet var appNameLable: UILabel!
    @IBOutlet var descriptionLable: UILabel!
    @IBOutlet var resultLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func generateColor(_ sender: UIButton) {
        let color = getRandomColor()
        colorNameLable.text = color.getColorCode()
        colorNameLable.textColor = color.getComplementary()
        appNameLable.textColor = color.getComplementary()
        descriptionLable.textColor = color.getComplementary()
        resultLable.textColor = color.getComplementary()
        view.backgroundColor = color
    }
    
    func getRandomColor() -> UIColor {
        let r = CGFloat(Float.random(in: 0...255)/255)
        let g = CGFloat(Float.random(in: 0...255)/255)
        let b = CGFloat(Float.random(in: 0...255)/255)
        let a = CGFloat(Float.random(in: 0...255)/255)
        let c = UIColor(red: r, green: g, blue: b, alpha: a)
        
        return c
    }
}

extension UIColor {
    func getColorCode() -> String{
        var code = "#"
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            code = code + String(format:"%02X", iAlpha) + String(format:"%02X", iRed) + String(format:"%02X", iGreen) + String(format:"%02X", iBlue)
            return code
        }else{
            return ""
        }
    }
    
    func getComplementary() -> UIColor{
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
             return UIColor(red: 1-fRed, green: 1-fGreen, blue: 1-fBlue, alpha: 1)
        }else{
            return UIColor()
        }
    }
}

