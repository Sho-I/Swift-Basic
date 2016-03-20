//
//  ViewController.swift
//  UI_2.1.2_UIButton
//
//  Created by Sho-I on 2016/03/20.
//  Copyright © 2016年 Sho-I. All rights reserved.
//

import UIKit

enum WafuColor: Int {
    
    case sakura = 0
    case azuki
    case kogane
    case moegi
    case kodaimurasaki
    case countDummy
    
    static var count: Int {
        return self.countDummy.hashValue - 1
    }
    
    // 色取得
    func getColor() -> UIColor {
        
        switch self {
        case .sakura:
            // 桜色さくらいろ      #fef4f4
            return UIColor(red: (0xfe/0xff), green: (0xf4/0xff), blue: (0xf4/0xff), alpha: 1.0)
        case .azuki:
            // 小豆色あずきいろ    #96514d
            return UIColor(red: (0x96/0xff), green: (0x51/0xff), blue: (0x4d/0xff), alpha: 1.0)
        case .kogane:
            // 黄金こがね         #e6b422
            return UIColor(red: (0xe6/0xff), green: (0xb4/0xff), blue: (0x22/0xff), alpha: 1.0)
        case .moegi:
            // 萌葱色もえぎいろ    #006e54
            return UIColor(red: (0x00/0xff), green: (0x6e/0xff), blue: (0x54/0xff), alpha: 1.0)
        case .kodaimurasaki:
            // 古代紫こだいむらさき #895b8a
            return UIColor(red: (0x89/0xff), green: (0x5b/0xff), blue: (0x8a/0xff), alpha: 1.0)
        default:
            return UIColor.blackColor()
        }
    }
    
    // 色名取得
    func getColorName() -> String {
        switch self {
        case .sakura:
            // 桜色さくらいろ      #fef4f4
            return "桜色(さくらいろ) [#fef4f4]"
        case .azuki:
            // 小豆色あずきいろ    #96514d
            return "小豆色(あずきいろ) [#96514d]"
        case .kogane:
            // 黄金こがね         #e6b422
            return "黄金(こがね) [#e6b422]"
        case .moegi:
            // 萌葱色もえぎいろ    #006e54
            return "萌葱色(もえぎいろ) [#006e54]"
        case .kodaimurasaki:
            // 古代紫こだいむらさき #895b8a
            return "古代紫(こだいむらさき) [#895b8a]"
        default:
            return "エラー [#000000]"
        }
    }
    
//    // 桜色さくらいろ      #fef4f4
//    private func sakuraColor() -> UIColor {
//        return UIColor(red: (0xfe/0xff), green: (0xf4/0xff), blue: (0xf4/0xff), alpha: 1.0)
//    }
//    // 小豆色あずきいろ    #96514d
//    private func azukiColor() -> UIColor {
//        return UIColor(red: (0x96/0xff), green: (0x51/0xff), blue: (0x4d/0xff), alpha: 1.0)
//    }
//    // 黄金こがね         #e6b422
//    private func koganeColor() -> UIColor {
//        return UIColor(red: (0xe6/0xff), green: (0xb4/0xff), blue: (0x22/0xff), alpha: 1.0)
//    }
//    // 萌葱色もえぎいろ    #006e54
//    private func moegiColor() -> UIColor {
//        return UIColor(red: (0x00/0xff), green: (0x6e/0xff), blue: (0x54/0xff), alpha: 1.0)
//    }
//    // 古代紫こだいむらさき #895b8a
//    private func kodaimurasakiColor() -> UIColor {
//        return UIColor(red: (0x89/0xff), green: (0x5b/0xff), blue: (0x8a/0xff), alpha: 1.0)
//    }
}

class ViewController: UIViewController {

    // MARK: interface
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var colorButton: UIButton!
    
    let labeltext = "Swift Basic!!"
    let buttonText = "Change Color"
    var colorNum:Int = 0
    var wafuColor: WafuColor!
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayLabel.text = labeltext
        colorButton.setTitle(buttonText, forState: .Normal)
        wafuColor = WafuColor(rawValue: colorNum)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeLabelColor(sender: AnyObject) {
        
        // set color
        displayLabel.textColor = wafuColor.getColor()
        colorButton.setTitle(wafuColor.getColorName(), forState: .Normal)
        
        // count up
        colorNum++
        
        // initialize
        if colorNum > WafuColor.count {
            colorNum = 0
        }
        // 最後にセット
        wafuColor = WafuColor(rawValue: colorNum)
    }

}

