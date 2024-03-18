//
//  GratitudejournalView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class GratitudejournalView : UIView {
    
    // MARK: - Component
    let mainLabel = MainSectionLabel(text: "감사일기")
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "작성하기", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()
    
    let bulletTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .grouped)

        table.backgroundColor = .brown
        return table
    }()

    
    // MARK: - Initial Method

//    init(frame: CGRect, size : Size){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setupBlockSize()
        setupAutoLayout()
    }
    
    override func draw(_ rect: CGRect) { //내부 컨텐츠(색상, 이미지, 텍스트 등) 다시 그리기
        
        super.draw(rect)
//        clipsToBounds = true
//        layer.cornerRadius = frame.height / 7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - layout
    
    
    func setupAutoLayout () {
        [mainLabel,
         addButton,
         bulletTableView
        ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
//            self.heightAnchor.constraint(equalToConstant: 400),
            
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            addButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            
            bulletTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            bulletTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bulletTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            bulletTableView.widthAnchor.constraint(equalTo: widthAnchor),
            bulletTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
        ])
        
    }
    
    
}
