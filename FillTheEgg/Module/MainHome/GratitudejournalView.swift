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
//
//    let numberLabel : UILabel = {
//       let label = UILabel()
//        label.text = "1"
//        label.layer.cornerRadius = 10
//        label.layer.masksToBounds = true
//        label.backgroundColor = Assets.Colors.gray3.color
//        label.textColor = Assets.Colors.white.color
//        label.textAlignment = .center
//        return label
//    }()
//
////    let bullet
//
//    let listLabel : UILabel = {
//        let label = UILabel()
//        label.text = GratitudeJournalList[0]
//        label.textColor = Assets.Colors.gray3.color
//        label.numberOfLines = 0
//
//        return label
//    }()

    
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
    
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        [mainLabel,
         addButton,
//         numberLabel,
//         listLabel
        ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 200),
            
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            addButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            
//            numberLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
//            numberLabel.widthAnchor.constraint(equalToConstant: 30),
//            numberLabel.heightAnchor.constraint(equalToConstant: 30),
//
//            listLabel.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
//            listLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 10)
            
            
            
        ])
        
    }
    
    
}
