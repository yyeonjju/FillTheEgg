//
//  SecondOnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class SecondOnboardingView : UIView {
    let imageWidth = UIScreen.main.bounds.width-100
    let heightRaio = 1.0
    private lazy var simpleOnboardingPageView = SimpleOnboardingPageView(text: "사진으로 오전 출석을 인증하세요!", imageWidth: imageWidth, imageHeight: (imageWidth*heightRaio), imageName : Assets.Assets.mockImageAttendanceCheck.name)
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAddSubView() {
        [simpleOnboardingPageView]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            simpleOnboardingPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            simpleOnboardingPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            simpleOnboardingPageView.topAnchor.constraint(equalTo: topAnchor),
            simpleOnboardingPageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }

    
}
