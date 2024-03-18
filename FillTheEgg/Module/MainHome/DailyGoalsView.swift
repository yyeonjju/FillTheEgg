//
//  DailyGoalsView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class DailyGoalsView : UIView {
    
    // MARK: - Component
    let mainLabel = MainSectionLabel(text: "오전목표")
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "작성하기", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()

    let bulletChckboxTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .plain)
//        table.backgroundColor = Assets.Colors.white.color
        return table
    }()

    

    
    // MARK: - Initial Method

//    init(frame: CGRect, size : Size){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setupBlockSize()
        setupAutoLayout()
    }
    
//    override func draw(_ rect: CGRect) { //내부 컨텐츠(색상, 이미지, 텍스트 등) 다시 그리기
//        super.draw(rect)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        [mainLabel,
         addButton,
         bulletChckboxTableView
        ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            
            bulletChckboxTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            bulletChckboxTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bulletChckboxTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bulletChckboxTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    
}
