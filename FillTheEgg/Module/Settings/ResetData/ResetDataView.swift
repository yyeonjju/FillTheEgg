//
//  ResetDataView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class ResetDataView : UIView {
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "초기화 시, \n 이전 출석, 감사일기, 오전목표에 대한 \n 히스토리가 모두 삭제됩니다."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = Assets.Colors.warningRed.color
        return label
    }()
    
    let deleteDataButton: ButtonWithOutLine = {
        let button = ButtonWithOutLine(title: "초기화하기", color: Assets.Colors.warningRed.color, borderColor: Assets.Colors.warningRed.color.cgColor, backgroundColor : Assets.Colors.gray7.color, fontSize: 18)
        button.setTitle("초기화하기", for: .normal)
        return button
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAddSubView() {
        [label, deleteDataButton]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deleteDataButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            deleteDataButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteDataButton.heightAnchor.constraint(equalToConstant: 50),
            deleteDataButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            deleteDataButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            
        ])
    }

}
