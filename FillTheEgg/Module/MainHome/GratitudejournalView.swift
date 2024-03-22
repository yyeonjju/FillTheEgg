//
//  GratitudejournalView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class GratitudejournalView : UIView {
    
    // MARK: - Component
    private let mainLabel = MainSectionLabel(text: "감사일기")
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "작성하기", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()
    
    let bulletTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .plain)
//        table.backgroundColor = Assets.Colors.white.color
        return table
    }()
    
    private let defaultView : BlankView = {
        let view = BlankView(text: BlankViewText.gratitudeJournalHomeViewText)
        
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

    
    // MARK: - layout
    
    
    func setupAutoLayout () {
        [mainLabel,
         addButton,
         bulletTableView,
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
        if gratitudeJournalList.isEmpty {
            NSLayoutConstraint.activate([
                defaultView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
                defaultView.widthAnchor.constraint(equalTo: widthAnchor),
                defaultView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
            
        } else {
            defaultView.isHidden = true
            
            NSLayoutConstraint.activate([
                bulletTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
                bulletTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                bulletTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                bulletTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        
        
        
    }
    
    
}
