//
//  DailyGoalsView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class DailyGoalsView : UIView {
    
    // MARK: - Component
    private let mainLabel = MainSectionLabel(text: "오전목표")
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "작성하기", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()

    let bulletChckboxTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .plain)
//        table.backgroundColor = Assets.Colors.white.color
        return table
    }()
    
    private let defaultView : BlankView = {
        let view = BlankView(text: BlankViewText.dailyGoalHomeViewText)
        
        return view
    }()

    

    
    // MARK: - Initial Method

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setupBlockSize()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        [mainLabel,
         addButton,
         bulletChckboxTableView,
         defaultView
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
            
        ])
        
        
        // 데이터가 있는지에 따라서 뷰 보여주기
        if dailyGoalList.isEmpty {
            NSLayoutConstraint.activate([
                defaultView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
                defaultView.widthAnchor.constraint(equalTo: widthAnchor),
                defaultView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
            
        } else {
            defaultView.isHidden = true
            
            NSLayoutConstraint.activate([
                bulletChckboxTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
                bulletChckboxTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                bulletChckboxTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                bulletChckboxTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
        }
        
    }
    
    
}
