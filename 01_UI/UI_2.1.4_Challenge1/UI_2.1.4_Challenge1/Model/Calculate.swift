//
//  Calculate.swift
//  UI_2.1.4_Challenge1
//
//  Created by ShoIto on 2016/04/16.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import Foundation

//struct Calculate {
//    
//    static func calc(symbols:[AnyObject]) -> [AnyObject] {
//        var reStructArray = [AnyObject]()
//        var count: Int = 0
//        for symbol in symbols {
//            if (count - 1) < 0 {
//                reStructArray.append(symbol)
//            } else {
//                let unknownType = reStructArray[count - 1]
//                // classチェックで"is"が使える
//                if (unknownType is NSNumber) && (symbol is NSNumber) {
//                    // 前に入力されたものも数字なので桁数増やす
//                    reStructArray[count - 1] = digitsIncrement(Int(unknownType as! NSNumber), singleDigit: Int(symbol as! NSNumber))
//                } else {
//                    // 前に入力されたものは数字以外
//                    reStructArray[count] = symbol
//                }
//            }
//            // インクリメントは+=推奨
//            count += 1
//        }
//        return reStructArray
//    }
//    
//    // 数字が連続で入力されている場合は、桁数を増やす処理
//    static func digitsIncrement(multiDigits: Int, singleDigit: Int) -> Int {
//        return (multiDigits * 10 + singleDigit)
//    }
//}

/*
 ±、末尾が数字なら-1をかける、そうでなければ-0をかける
 ×、÷、%
 
 */

protocol CalcProtocol {
    func moldingZero(number: String) -> String
    func calculate(numberString: String, symbol: String) -> String
    func calculate(calcArray: [String]) -> [String]?
}

extension CalcProtocol {
    
    func moldingZero(number: String) -> String {
        guard let intNumber = Int(number) else {
            return ""
        }
        return String(intNumber)
    }
    
    func calculate(numberString: String, symbol: String) -> String {
        if numberString.containsString(".") {
            guard let number = Double(numberString) else {
                return ""
            }
            switch symbol {
            case "±":
                return String(number * -1)
            case "%":
                return String(number / 100)
            default:break
            }
        } else {
            guard let number = Int(numberString) else {
                return ""
            }
            switch symbol {
            case "±":
                return String(number * -1)
            case "%":
                return String(Double(number) / 100)
            default:break
            }
        }
        return "0"
    }
    
    func calculate(calcArray: [String]) -> [String]? {
        print("extension")
        if calcArray.count > 2 {
            
        } else {
            return nil
        }
        
        return nil
    }
}