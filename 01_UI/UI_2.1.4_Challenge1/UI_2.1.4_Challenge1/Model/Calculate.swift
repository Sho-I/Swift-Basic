//
//  Calculate.swift
//  UI_2.1.4_Challenge1
//
//  Created by ShoIto on 2016/04/16.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import Foundation

protocol CalcProtocol {
    func moldingZero(number: String) -> String
    func calculate(numberString: String, symbol: String) -> String
    func calculate(calcArray: [String]) -> [String]
}

extension CalcProtocol {
    
    // 連続した0を整形
    func moldingZero(number: String) -> String {
        guard let intNumber = Int(number) else {
            return ""
        }
        return String(intNumber)
    }
    
    // 計算処理 ± %
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
    
    // 計算処理 + - * / =
    func calculate(argumentArray: [String]) -> [String] {
        // 1+2+     3'+
        // 1+2*3+   7'+
        // 1+2*3*   1+6'*
        // 2*3*     6'*
        // 2*3+     6'+
        // 2+=      4'
        // 2*=      4'
        var calcArray = argumentArray
        var isDouble = false
        // repeat用フラグ
        var isFinishIntegration = true
        var isFinishDivision = true
        var isFinishAdding = true
        var isFinishSubtractionIndex = true
        
        // 計算がIntかDoubleか分別
        for string in calcArray {
            if string.containsString(".") {
                isDouble = true
            }
        }
        
        // += -= *= /= の式置き換え
        if let equalIndex = calcArray.indexOf("=") {
            switch calcArray[equalIndex - 1] {
            case "+", "-", "×", "÷":
                if isDouble {
                    guard let leftNumber = Double(calcArray[equalIndex - 2]) else {
                        return calcArray
                    }
                    calcArray.insert(String(leftNumber), atIndex: equalIndex)
                } else {
                    guard let leftNumber = Int(calcArray[equalIndex - 2]) else {
                        return calcArray
                    }
                    calcArray.insert(String(leftNumber), atIndex: equalIndex)
                }
            default:
                break
            }
        }
        
        // 計算の優先度考慮のための処理
        if calcArray[1] == "+" || calcArray[1] == "-" {
            if calcArray.count < 4 {
                return calcArray
            }
        }
        
        // 計算実処理
        if isDouble {
            repeat {
                // ×
                if let integrationIndex = calcArray.indexOf("×") {
                    // 末尾でない
                    if integrationIndex != calcArray.count - 1 {
                        let totalNumber = Double(calcArray[integrationIndex - 1])! * Double(calcArray[integrationIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(integrationIndex - 1...integrationIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: integrationIndex - 1)
                    } else {
                        // まだ計算する段階ではないのでreturn ex.1+2*3*
                        return calcArray
                    }
                } else {
                    isFinishIntegration = false
                }
                // ÷
                if let divisionIndex = calcArray.indexOf("÷") {
                    // 末尾でない
                    if divisionIndex != calcArray.count - 1 {
                        let totalNumber = Double(calcArray[divisionIndex - 1])! / Double(calcArray[divisionIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(divisionIndex - 1...divisionIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: divisionIndex - 1)
                    } else {
                        // まだ計算する段階ではないのでreturn ex.1+2*3*
                        return calcArray
                    }
                } else {
                    isFinishDivision = false
                }
            } while (isFinishIntegration || isFinishDivision)
            
            repeat {
                // +
                if let addingIndex = calcArray.indexOf("+") {
                    // 末尾でない
                    if addingIndex != calcArray.count - 1 {
                        let totalNumber = Double(calcArray[addingIndex - 1])! + Double(calcArray[addingIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(addingIndex - 1...addingIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: addingIndex - 1)
                    } else {
                        isFinishAdding = false
                    }
                } else {
                    isFinishAdding = false
                }
                // -
                if let subtractionIndex = calcArray.indexOf("-") {
                    // 末尾でない
                    if subtractionIndex != calcArray.count - 1 {
                        let totalNumber = Double(calcArray[subtractionIndex - 1])! - Double(calcArray[subtractionIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(subtractionIndex - 1...subtractionIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: subtractionIndex - 1)
                    } else {
                        isFinishSubtractionIndex = false
                    }
                } else {
                    isFinishSubtractionIndex = false
                }
            } while (isFinishAdding || isFinishSubtractionIndex)
        } else {
            repeat {
                // ×
                if let integrationIndex = calcArray.indexOf("×") {
                    // 末尾でない
                    if integrationIndex != calcArray.count - 1 {
                        let totalNumber = Int(calcArray[integrationIndex - 1])! * Int(calcArray[integrationIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(integrationIndex - 1...integrationIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: integrationIndex - 1)
                    } else {
                        // まだ計算する段階ではないのでreturn ex.1+2*3*
                        return calcArray
                    }
                } else {
                    isFinishIntegration = false
                }
                // ÷
                if let divisionIndex = calcArray.indexOf("÷") {
                    // 末尾でない
                    if divisionIndex != calcArray.count - 1 {
                        let totalNumber = Int(calcArray[divisionIndex - 1])! / Int(calcArray[divisionIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(divisionIndex - 1...divisionIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: divisionIndex - 1)
                    } else {
                        // まだ計算する段階ではないのでreturn ex.1+2*3*
                        return calcArray
                    }
                } else {
                    isFinishDivision = false
                }
            } while (isFinishIntegration || isFinishDivision)
            
            repeat {
                // +
                if let addingIndex = calcArray.indexOf("+") {
                    // 末尾でない
                    if addingIndex != calcArray.count - 1 {
                        let totalNumber = Int(calcArray[addingIndex - 1])! + Int(calcArray[addingIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(addingIndex - 1...addingIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: addingIndex - 1)
                    } else {
                        isFinishAdding = false
                    }
                } else {
                    isFinishAdding = false
                }
                // -
                if let subtractionIndex = calcArray.indexOf("-") {
                    // 末尾でない
                    if subtractionIndex != calcArray.count - 1 {
                        let totalNumber = Int(calcArray[subtractionIndex - 1])! - Int(calcArray[subtractionIndex + 1])!
                        // 不要になった値らを削除
                        calcArray.removeRange(Range(subtractionIndex - 1...subtractionIndex + 1))
                        calcArray.insert(String(totalNumber), atIndex: subtractionIndex - 1)
                    } else {
                        isFinishSubtractionIndex = false
                    }
                } else {
                    isFinishSubtractionIndex = false
                }
            } while (isFinishAdding || isFinishSubtractionIndex)
        }
        
        return calcArray
    }
}