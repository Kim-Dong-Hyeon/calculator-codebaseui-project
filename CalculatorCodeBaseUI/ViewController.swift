//
//  ViewController.swift
//  CalculatorCodeBaseUI
//
//  Created by 김동현 on 6/24/24.
//

import UIKit
import SnapKit

/// ViewController : CalculatorCodeBaseUI 앱의 메인 화면을 구성하는 역할
class ViewController: UIViewController {
    
    /// numberLabel : 숫자와 결과를 표시하는 UILabel
    var numberLabel = UILabel()
    /// verticalStackView : 여러 개의 horizontalStackView를 담는 verticalStackView
    var verticalStackView = UIStackView()
    /// currentInput : 현재 입력된 문자열을 저장하는 변수
    var currentInput = "0"
    
    /// calculate : 계산을 담당하는 Calculate 인스턴스
    let calculate = Calculate()
    
    /// numbers : 버튼에 들어갈 문자들의 배열
    let numbers = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "×"],
        ["AC", "0", "=", "÷"]
    ]
    
    /// viewDidLoad : 뷰가 로드될 때 호출되는 함수. 초기 UI 설정을 수행
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeNumberLabel()
        makeVerticalStackView()
    }
    
    /// makeNumberLabel : numberLabel을 설정하고 제약 조건을 추가하는 함수
    private func makeNumberLabel() {
        numberLabel.text = "0"
        numberLabel.textColor = .white
        numberLabel.textAlignment = .right
        numberLabel.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(numberLabel)
        
        numberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
    /// makeVerticalStackView : verticalStackView를 설정하고 HorizontalStackView를 추가하는 함수
    private func makeVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        for buttonTitles in numbers {
            let buttons = buttonTitles.map { makeButton($0) }
            let horizontalStackView = makeHorizontalStackView(buttons)
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(numberLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    /// makeHorizontalStackView : 주어진 뷰 배열을 가로로 정렬하는 UIStackView를 생성하는 함수
    /// - Parameter views: 가로로 배치할 UIView 배열
    /// - Returns: 생성된 가로 UIStackView
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView(arrangedSubviews: views)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        horizontalStackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        return horizontalStackView
    }
    
    /// makeButton : 주어진 title로 UIButton을 생성하는 함수
    /// - Parameter title: 버튼에 들어갈 문자열
    /// - Returns: 성성된 UIButton
    private func makeButton(_ title: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        // 숫자 버튼과 연산 버튼의 배경색을 구분하여 설정
        if Int(title) != nil {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        } else {
            button.backgroundColor = .orange
        }
        
        return button
    }
    
    /// buttonTapped : 버튼이 눌렸을 때 호출되는 함수
    /// - Parameter sender: 눌린 UIButton
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        if title == "AC" {
            currentInput = "0"
        } else if title == "=" {
            let formattedExpression = calculate.formatExpression(currentInput)
            if let result = calculate.calculate(expression: formattedExpression) {
                currentInput = String(result)
            } else {
                currentInput = "Error"
            }
        } else {
            if currentInput == "0" {
                currentInput = title
            } else {
                currentInput += title
            }
        }
        
        // 맨 앞자리가 "0"인 경우 "0"을 지우기
        if currentInput.hasPrefix("0") && currentInput.count > 1 {
            currentInput.removeFirst()
        }
        
        numberLabel.text = currentInput
    }

}

#Preview {
    let name = ViewController()
    return name
}
