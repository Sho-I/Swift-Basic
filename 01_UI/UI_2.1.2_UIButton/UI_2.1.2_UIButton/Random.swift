//
//  Random.swift
//  UI_2.1.2_UIButton
//
//  Created by Sho-I on 2016/03/21.
//  Copyright © 2016年 Sho-I. All rights reserved.
//

import Foundation

struct Random {
    
    // MARK: interface

    // UInt32で乱数を返す
    static func createIntNumber(maxNum: UInt32) -> UInt32 {
        
        return arc4random_uniform(maxNum)
    }
    
    static func createColorFloat() -> Float32 {
        // staticなため、ここで変数作成
        let colorMaxNum:UInt32 = 256
        
        return (Float32(createIntNumber(colorMaxNum)) / Float32(colorMaxNum))
    }
}