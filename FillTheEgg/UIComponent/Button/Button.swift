//
//  Button.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class ButtonWithOutLine : UIButton {
    
    init(frame: CGRect = .zero, title : String, color : UIColor, borderColor : CGColor) {
        super.init(frame: frame)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = FontFamily.Pretendard.regular.font(size: 15)
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor
        
        self.layer.cornerRadius = 10
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func updateConstraints () {
        super.updateConstraints()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        

    }
    
}
