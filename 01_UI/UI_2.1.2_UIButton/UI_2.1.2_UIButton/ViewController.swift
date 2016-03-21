//
//  ViewController.swift
//  UI_2.1.2_UIButton
//
//  Created by Sho-I on 2016/03/20.
//  Copyright © 2016年 Sho-I. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: interface
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var leftButton: UIButton!
    
    @IBOutlet var rightLabel: UILabel!
    @IBOutlet var rightButton: UIButton!
    
    let labeltext = "Swift Basic!!"
    let buttonText = "Change Color"
    var colorNum:Int = 0
    var wafuColor: WafuColor!
    let randomMax:UInt32 = 256
    let radixNum = 16
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        leftLabel.text = labeltext
        leftButton.setTitle(buttonText, forState: .Normal)
        rightButton.setTitle(buttonText, forState: .Normal)
        wafuColor = WafuColor(rawValue: colorNum)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeLeftLabelColor(sender: AnyObject) {
        
        // set color
        leftLabel.textColor = wafuColor.getColor()
        leftButton.setTitle(wafuColor.getColorName(), forState: .Normal)
        
        // count up
        colorNum++
        
        // initialize
        if colorNum > WafuColor.count {
            colorNum = 0
        }
        // 最後にセット
        wafuColor = WafuColor(rawValue: colorNum)
    }

    @IBAction func changeRightLabelColor(sender: AnyObject) {
        
        // 乱数取得
        let redNum = Random.createIntNumber(randomMax)
        let greenNum = Random.createIntNumber(randomMax)
        let blueNum = Random.createIntNumber(randomMax)
        // 色生成
        let redColor = CGFloat(redNum) / CGFloat(randomMax)
        let greenColor = CGFloat(greenNum) / CGFloat(randomMax)
        let blueColor = CGFloat(blueNum) / CGFloat(randomMax)
        
        // 文字列作成
        let colorStr = "#"+String(redNum, radix:radixNum)+" "+String(greenNum, radix:radixNum)+" "+String(blueNum, radix:radixNum)
        
        // set color
        rightLabel.textColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
        rightButton.setTitle(colorStr, forState: .Normal)
        
        
    }
}

