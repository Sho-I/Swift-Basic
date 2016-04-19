//
//  ViewController.swift
//  UI_2.1.4_Challenge1
//
//  Created by Aryzae on 2016/03/26.
//  Copyright © 2016年 Aryzae. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: interface
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var buttonCollectionView: UICollectionView!
    
    let CUSTOM_BUTTON_CELL_ID = "CustomButtonCellId"
    let symbolArray = ["C","±","%","÷","7","8","9","×","4","5","6","-","1","2","3","+","0",".","="]
    var keepRect = CGRectZero
    // C,±,%
    let CELL_BG_COLOR_GRAY_R: CGFloat = 0xc0/0xff
    let CELL_BG_COLOR_GRAY_G: CGFloat = 0xc0/0xff
    let CELL_BG_COLOR_GRAY_B: CGFloat = 0xc3/0xff
    let CELL_BG_COLOR_GRAY_A: CGFloat = 0xff/0xff
    // .,0~9
    let CELL_BG_COLOR_LIGHT_GRAY_R: CGFloat = 0xc8/0xff
    let CELL_BG_COLOR_LIGHT_GRAY_G: CGFloat = 0xc9/0xff
    let CELL_BG_COLOR_LIGHT_GRAY_B: CGFloat = 0xcc/0xff
    let CELL_BG_COLOR_LIGHT_GRAY_A: CGFloat = 0xff/0xff
    // ÷,×,-,+,=
    let CELL_BG_COLOR_ORANGE_R: CGFloat = 0xf8/0xff
    let CELL_BG_COLOR_ORANGE_G: CGFloat = 0x79/0xff
    let CELL_BG_COLOR_ORANGE_B: CGFloat = 0x12/0xff
    let CELL_BG_COLOR_ORANGE_A: CGFloat = 0xff/0xff
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegate & DataSource
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
        buttonCollectionView.registerClass(CustomButtonCell.self, forCellWithReuseIdentifier: CUSTOM_BUTTON_CELL_ID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(self.view.bounds)")
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        print(indexPath.row)
        return true
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symbolArray.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var customButtonCell = CustomButtonCell()
        customButtonCell = buttonCollectionView!.dequeueReusableCellWithReuseIdentifier(CUSTOM_BUTTON_CELL_ID, forIndexPath: indexPath) as! CustomButtonCell
        customButtonCell.symbolLabel.text = symbolArray[indexPath.row]
        
        // 特殊処理(0の位置調整)
        if customButtonCell.symbolLabel.text == "0" {
            customButtonCell.symbolLabel.frame = keepRect // boundsで指定すると中央合わせになる
        } else {
            keepRect = customButtonCell.symbolLabel.frame
        }
        
        // Cellの背景色設定
        if indexPath.row % 4 == 3 || indexPath.row == symbolArray.count - 1 {
            customButtonCell.backgroundColor = UIColor(red: CELL_BG_COLOR_ORANGE_R,
                                                       green: CELL_BG_COLOR_ORANGE_G,
                                                       blue: CELL_BG_COLOR_ORANGE_B,
                                                       alpha: CELL_BG_COLOR_ORANGE_A)
            customButtonCell.symbolLabel.textColor = .whiteColor()
        } else {
            switch indexPath.row {
            case 0...3:
                customButtonCell.backgroundColor = UIColor(red: CELL_BG_COLOR_GRAY_R,
                                                           green: CELL_BG_COLOR_GRAY_G,
                                                           blue: CELL_BG_COLOR_GRAY_B,
                                                           alpha: CELL_BG_COLOR_GRAY_A)
            default:
                customButtonCell.backgroundColor = UIColor(red: CELL_BG_COLOR_LIGHT_GRAY_R,
                                                           green: CELL_BG_COLOR_LIGHT_GRAY_G,
                                                           blue: CELL_BG_COLOR_LIGHT_GRAY_B,
                                                           alpha: CELL_BG_COLOR_LIGHT_GRAY_A)
            }
        }
        
        return customButtonCell
    }
}

