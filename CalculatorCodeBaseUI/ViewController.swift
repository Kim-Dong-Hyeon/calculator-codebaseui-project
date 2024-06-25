//
//  ViewController.swift
//  CalculatorCodeBaseUI
//
//  Created by 김동현 on 6/24/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var numberLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createNumberLabel()
    }
    
    private func createNumberLabel() {
        numberLabel.text = "12345"
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

}

