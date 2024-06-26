//
//  ThirdOnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class ThirdOnboardingView : UIView {
    let imageWidth = UIScreen.main.bounds.width-20
    let heightRaio = 0.63
    private lazy var simpleOnboardingPageView = SimpleOnboardingPageView(text: "감사일기를 3개 작성해보세요. \n 행복한 하루의 시작입니다!", imageWidth: imageWidth, imageHeight: (imageWidth*heightRaio), imageName : Assets.Assets.mockImageGratitudeJournal.name)
    
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
