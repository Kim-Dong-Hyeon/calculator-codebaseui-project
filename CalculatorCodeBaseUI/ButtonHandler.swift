//
//  ButtonHandler.swift
//  CalculatorCodeBaseUI
//
//  Created by 김동현 on 6/24/24.
//

import UIKit

/// ButtonHandler : 버튼 클릭을 처리하는 클래스
class ButtonHandler {
    
    /// currentInput : 현재 입력된 문자열을 저장하는 변수
    var currentInput = "0"
    
    /// calculator : 계산을 담당하는 Calculator 인스턴스
    let calculate = Calculate()
    
    /// expressionCleaner : 수식 문자열을 정리하는 ExpressionCleaner 인스턴스
    let expressionCleaner = ExpressionCleaner()
    
    /// numberLabel : 결과를 표시하는 UILabel
    weak var numberLabel: UILabel?
    
    /// viewController : 알림을 표시하기 위한 ViewController
    weak var viewController: UIViewController?
    
    init(numberLabel: UILabel, viewController: UIViewController) {
        self.numberLabel = numberLabel
        self.viewController = viewController
    }
    
    /// buttonTapped : 버튼이 눌렸을 때 호출되는 함수
    /// - Parameter sender: 눌린 UIButton
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        if title == "AC" {
            currentInput = "0"
            // numberLabel 업데이트
            numberLabel?.text = currentInput
            return
        }
        
        if title == "=" {
            if expressionCleaner.isValidExpression(currentInput) {
                let formattedExpression = calculate.formatExpression(currentInput)
                if let result = calculate.calculate(expression: formattedExpression) {
                    currentInput = String(result)
                } else {
                    showAlert("Error", "잘못된 수식입니다.")
                    currentInput = "0"
                }
            } else {
                showAlert("Error", "잘못된 수식입니다.")
                currentInput = "0"
            }
        } else {
            if currentInput == "0" {
                currentInput = title
            } else {
                currentInput += title
            }
        }
        
        // 불필요한 0을 제거하는 로직 추가
        if currentInput != "0" {
            currentInput = expressionCleaner.removeLeadingZeros(from: currentInput)
        }
        
        numberLabel?.text = currentInput
    }
    
    /// showAlert : 경고 메시지를 표시하는 함수
    /// - Parameters:
    ///   - title: 경고 창의 제목
    ///   - message: 경고 창의 메시지
    private func showAlert(_ title: String, _ message: String) {
        guard let viewController = viewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
