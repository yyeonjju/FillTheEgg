//
//  Button.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class BasicButton : UIButton {
    init(frame: CGRect = .zero, title : String, backgroundColor : UIColor) {
        super.init(frame: frame)
        
        setupUI(title: title, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI (title : String, backgroundColor : UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(Assets.Colors.white.color, for: .normal)
        self.titleLabel?.font = FontFamily.Pretendard.semiBold.font(size: 20)
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 15
        
    }
    
}

final class ButtonWithOutLine : UIButton {
    
    init(frame: CGRect = .zero, title : String, color : UIColor, borderColor : CGColor) {
        super.init(frame: frame)
        
        setupUI(title: title, color: color, borderColor: borderColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(title : String, color : UIColor, borderColor : CGColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = FontFamily.Pretendard.regular.font(size: 15)
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = 10
    
        self.clipsToBounds = true
    }
}
