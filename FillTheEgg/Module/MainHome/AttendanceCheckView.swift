//
//  AttendanceCheckView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit


final class AttendanceCheckView : UIView {
    
    // MARK: - Component
    let mainLabel = MainSectionLabel(text: "출석하기")
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "추가", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()
    
    let photoView : UIView = {
        let view = UIView()
        view.backgroundColor = .brown

        return view
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
    
    
    // MARK: - Event Method
    
    func setupAutoLayout () {
        [mainLabel, addButton, photoView]
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
            
            //photoView
            photoView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            photoView.widthAnchor.constraint(equalToConstant: 100),
            photoView.heightAnchor.constraint(equalToConstant: 100),
            photoView.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            
        ])
        
    }
    
    
    
}

