//
//  ViewController.swift
//  calculator project
//
//  Created by 김리하 on 9/5/25.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        // 수식 라벨
        label.text = "12345"
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false // 오토 레이아웃을 활성화하기 위해 반드시 작성해야되는 코드임
        view.addSubview(label) // 이 코드 미작성시 label이 보이지 않음 ㅠ 주의!!
        
        // 라벨 오토레이아웃
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
            
        ])
        
        // 버튼 데이터 (4줄)
        let rows = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        
        // 전체 세로 스택뷰
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStackView)
        
        // 세로 스택뷰 오토레이아웃
        NSLayoutConstraint.activate([
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 각 줄(가로 스택뷰) 추가
        for row in rows {
            let buttons = row.map { makeButton(with: $0) } // 제목 -> 버튼
            let rowStackView = makeHorizontalStackView(buttons) // 버튼 -> 가로줄
            verticalStackView.addArrangedSubview(rowStackView) // 세로 스택뷰에 추가
        }
        
    }
    
    // 버튼 만드는 함수
    private func makeButton(with title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        
        if ["+", "-", "*", "/", "=", "AC"].contains(title){
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        
        button.layer.cornerRadius = 40
        return button
    }
    
    // 가로 스택뷰 만드는 함수
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return stackView
    }
        
    

}
