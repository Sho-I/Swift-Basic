//
//  NumberCell.swift
//  UI_2.1.4_Challenge1
//
//  Created by Aryzae on 2016/03/26.
//  Copyright © 2016年 Aryzae. All rights reserved.
//

import UIKit

class CustomButtonCell: UICollectionViewCell {
    
    var symbolLabel: UILabel!
    
    private let FONT_SF_THIN = "SFUIDisplay-Thin"
    private let fontSize: CGFloat = 30.0
    // CellのBorderColor
    private let BORDER_COLOR_R: CGFloat = 0x7f/0xff
    private let BORDER_COLOR_G: CGFloat = 0x7f/0xff
    private let BORDER_COLOR_B: CGFloat = 0x7f/0xff
    private let BORDER_COLOR_A: CGFloat = 0xff/0xff
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCell()
        initializeLabel()
    }
    
    private func initializeCell() {
        // Cellの設定
        self.backgroundColor = .whiteColor()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: BORDER_COLOR_R,
                                         green: BORDER_COLOR_G,
                                         blue: BORDER_COLOR_B,
                                         alpha: BORDER_COLOR_A).CGColor
    }
    
    private func initializeLabel() {
        // Cellの上に乗せるLabelの設定
        symbolLabel = UILabel(frame: self.bounds)
        symbolLabel.textAlignment = .Center
        symbolLabel.font = UIFont(name: FONT_SF_THIN, size: fontSize)
        symbolLabel.backgroundColor = .clearColor()
        self.addSubview(symbolLabel)
    }
}
