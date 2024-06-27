//
//  Calculate.swift
//  CalculatorCodeBaseUI
//
//  Created by 김동현 on 6/27/24.
//

import Foundation

/// Calculator : 수식 계산을 담당하는 클래스
class Calculate {
    
    /// Calculate : 수식 문자열을 넣으면 계산해주는 함수
    ///
    /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
    /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    /// formatExpression : 수식 문자열을 Swift에서 계산 가능한 형식으로 변환하는 함수
    /// - Parameter expression: 사용자 입력 수식 문자열
    /// - Returns: 변환된 수식 문자열
    func formatExpression(_ expression: String) -> String {
        var formattedExpression = expression.replacingOccurrences(of: "×", with: "*")
        formattedExpression = formattedExpression.replacingOccurrences(of: "÷", with: "/")
        formattedExpression = formattedExpression.replacingOccurrences(of: "−", with: "-")
        return formattedExpression
    }
}
