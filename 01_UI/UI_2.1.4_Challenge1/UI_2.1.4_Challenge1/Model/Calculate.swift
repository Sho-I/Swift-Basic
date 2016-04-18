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
    
    func calculate(argumentArray: [String]) -> [String] {
        // 1+2+     3'+
        // 1+2*3+   7'+
        // 1+2*3*   1+6'*
        // 2*3*     6'*
        // 2*3+     6'+
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
                        isFinishIntegration = false
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
                        isFinishDivision = false
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
                        isFinishIntegration = false
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
                        isFinishDivision = false
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