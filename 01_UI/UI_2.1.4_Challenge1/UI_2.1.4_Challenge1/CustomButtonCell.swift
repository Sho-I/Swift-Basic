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
    let fontSFUIDisplayThin = "SFUIDisplay-Thin"
    let fontSize: CGFloat = 30.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeCell()
        initializeLabel()
    }
    
    private func initializeCell() {
        self.backgroundColor = .whiteColor()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    private func initializeLabel() {
        symbolLabel = UILabel(frame: self.bounds)
        symbolLabel.textAlignment = .Center
        symbolLabel.font = UIFont(name: fontSFUIDisplayThin, size: fontSize)
        symbolLabel.backgroundColor = .clearColor()
        self.addSubview(symbolLabel)
    }
}
