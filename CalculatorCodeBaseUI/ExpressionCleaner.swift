//
//  ExpressionCleaner.swift
//  CalculatorCodeBaseUI
//
//  Created by 김동현 on 6/27/24.
//

import Foundation

/// ExpressionCleaner : 수식 문자열을 정리하는 클래스
class ExpressionCleaner {
    
    /// removeLeadingZeros : 불필요한 0을 제거하는 함수
    /// - Parameter input: 입력된 수식 문자열
    /// - Returns: 불필요한 0이 제거된 수식 문자열
    func removeLeadingZeros(from input: String) -> String {
        var cleanedInput = ""
        var previousCharacter: Character? = nil
        
        for character in input {
            if character == "0" && (previousCharacter == nil || Int(String(previousCharacter!)) == nil) {
                // 현재 문자가 0이고, 이전 문자가 숫자가 아니거나 첫 문자이면 0을 생략
                continue
            } else {
                cleanedInput.append(character)
            }
            previousCharacter = character
        }
        
        return cleanedInput
    }
    
    /// isValidExpression : 수식 문자열의 형식을 검증하는 함수
    /// - Parameter expression: 사용자 입력 수식 문자열
    /// - Returns: 수식 문자열이 유효한 경우 true, 그렇지 않으면 false
    func isValidExpression(_ expression: String) -> Bool {
        let pattern = "^[0-9]+([+\\-*/][0-9]+)*$"
        return expression.range(of: pattern, options: .regularExpression) != nil
    }
}
