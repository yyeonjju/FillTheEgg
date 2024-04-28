//
//  ActionButtonsStackView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/28.
//

import UIKit



final class ActionButtonsStackView : UIStackView {
    let cancelButton : BasicButton = {
        let button = BasicButton(title: "취소", backgroundColor: Assets.Colors.eggWhite.color)
        return button
    }()
    
    let confirmButton : BasicButton = {
        let button = BasicButton(title: "확인", backgroundColor: Assets.Colors.warningRed.color)

        return button
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 20
        
        setupAddSubView()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAddSubView() {
        [cancelButton, confirmButton]
            .forEach{
                addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.heightAnchor.constraint(equalToConstant: 70),
            confirmButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }

}
