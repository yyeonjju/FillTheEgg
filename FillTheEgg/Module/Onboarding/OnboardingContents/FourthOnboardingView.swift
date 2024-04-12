//
//  FourthOnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class FourthOnboardingView : UIView {
    let imageWidth = UIScreen.main.bounds.width-20
    let heightRaio = 0.63
    private lazy var simpleOnboardingPageView = SimpleOnboardingPageView(text: "오전목표를 3개 작성하고 달성하면 \n 성취감은 보너스! (아주 가벼운 목표도 좋아요)", imageWidth: imageWidth, imageHeight: (imageWidth*heightRaio), imageName : Assets.Assets.mockImageDailyGoal.name)
    
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
