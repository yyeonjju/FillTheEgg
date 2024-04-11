//
//  FifthOnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class FifthOnboardingView : UIView {
    private let simpleOnboardingPageView = SimpleOnboardingPageView(text: "캘린더에서 나의 이전 달성률을 한번에 보세요. \n 과거의 나를 통해 자극받아 더 열심히 살기!", imageWidth: 300, imageHeight: 300, imageName : Assets.Assets.mockImageCalendar.name)
    
    let startButton : UIButton = {
       let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(Assets.Colors.white.color, for: .normal)
        button.titleLabel?.font = FontFamily.Pretendard.semiBold.font(size: 16)
        button.backgroundColor = Assets.Colors.gray2.color
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAddSubView() {
        [simpleOnboardingPageView, startButton]
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
            simpleOnboardingPageView.bottomAnchor.constraint(equalTo: simpleOnboardingPageView.imageView.bottomAnchor),
            
            startButton.topAnchor.constraint(equalTo: simpleOnboardingPageView.bottomAnchor, constant: 30),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    
}
