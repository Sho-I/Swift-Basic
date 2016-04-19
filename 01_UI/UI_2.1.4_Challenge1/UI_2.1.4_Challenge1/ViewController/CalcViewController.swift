//
//  ViewController.swift
//  UI_2.1.4_Challenge1
//
//  Created by ShoIto on 2016/03/26.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CalcProtocol {

    // MARK: interface
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var buttonCollectionView: UICollectionView!
    
    let CUSTOM_BUTTON_CELL_ID = "CustomButtonCellId"
    var symbolArray = ["AC","±","%","÷","7","8","9","×","4","5","6","-","1","2","3","+","0",".","="]
    private let numSections = 1
    var keepRect = CGRectZero
    
    var inputNumber = "0"               // 数字の桁数カウント用
    var isInputNumber = false           // 数字が入力されたかのフラグ
    var isAllowNumberDelete = false     // inputNumberを消去していいかのフラグ
    var inputArray: [String] = ["0"]    // 入力履歴
    var isClear = false
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
        
        // 省略表示にならないために
        displayLabel.adjustsFontSizeToFitWidth = true
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
        let index = indexPath.row
        // この辺enum使えばもっとスマートにいけるはず
        switch index {
        case 0:
            // AC/C クリア
//            if isClear {
                inputNumber.removeAll()
                inputNumber = "0"
                isAllowNumberDelete = false
                inputArray.removeAll()
                inputArray = ["0"]
                displayLabel.text = inputNumber
//            }
        case 1:
            // ±,
            inputNumber = calculate(inputNumber, symbol: symbolArray[index])
            displayLabel.text = inputNumber
        case 2:
            // %
            isAllowNumberDelete = true
            inputNumber = calculate(inputNumber, symbol: symbolArray[index])
            displayLabel.text = inputNumber
        case 4...6, 8...10, 12...14, 16:
            // 数字
            // Deleteフラグtrueなら削除
            if isAllowNumberDelete {
                inputNumber.removeAll()
                isAllowNumberDelete = false
            }
            //文字数による入力制限
            if inputNumber.characters.count < 9 {
                inputNumber.append(Character(symbolArray[index]))
            } else {
                // 文字数制限により入力受け付けない
                return false
            }
            // 0000の表示防止(Int型のみ)
            if !inputNumber.containsString(".") {
                inputNumber = moldingZero(inputNumber)
            }
            isInputNumber = true
            displayLabel.text = inputNumber
        case 3, 7, 11, 15:
            // ÷, ×, -, +
            commonPostProcessing(index)
            inputArray = calculate(inputArray)
        case 17:
            // 小数点
            if inputNumber.characters.count < 9 {
                inputNumber.append(Character(symbolArray[index]))
            }
        case 18:
            // =
            commonPostProcessing(index)
            inputArray = calculate(inputArray)
            
            guard let finishString = inputArray.first else {
                return false
            }
            displayLabel.text = finishString
            // 継続して計算できるように
            inputNumber = finishString
            isInputNumber = true
            inputArray.removeAll()
            inputArray = ["0"]
        default:
            break
        }
        
        print(inputArray)
        
        if index == 0 {
            symbolArray[0] = "AC"
            isClear = true
        } else {
            symbolArray[0] = "C"
            isClear = false
        }
        
        return true
    }
    
    // MARK: Private Method
    private func commonPostProcessing(index: Int) {
        if isInputNumber {
            // 初期の0のみであれば、消去して入れ直す(四則演算記号を連続押ししてる場合も入れる前に削除しているため下記条件を満たせる)
            if inputArray.count == 1 && inputArray.first! == "0" {
                inputArray.removeAll()
            }
            // 数字以外が入力されたので、配列に格納&数字用格納変数は消去
            inputArray.append(inputNumber)
            isInputNumber = false
            isAllowNumberDelete = true
        }
        
        // 四則演算記号は常に入力(但し、直前も同系記号の場合、前プロセスで削除している)
        guard let checkString = inputArray.last else {
            return
        }
        // "="は除く
        if index != 18 {
            switch checkString {
            case "+", "-", "×", "÷":
                inputArray.removeLast()
            default:
                break
            }
        }
        inputArray.append(symbolArray[index])
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symbolArray.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numSections
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

