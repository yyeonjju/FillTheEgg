//
//  Label.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit


final class MainSectionLabel : UILabel {
    
    init(frame: CGRect = .zero, text : String) {
        super.init(frame: frame)
        
        self.text = text
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.textColor = Assets.Colors.mainYellow.color
        self.font = FontFamily.Pretendard.semiBold.font(size: FontSize.mainSectionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
