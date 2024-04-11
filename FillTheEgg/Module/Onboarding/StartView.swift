//
//  StartView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

final class StartView : UIView {
    private let topLabel : UILabel = {
        let label = UILabel()
        label.text = "당신의 아침루틴 메이트 \n 알찬하루🥚"
        label.textAlignment = .center
        label.font = FontFamily.Pretendard.bold.font(size: 20)
        label.textColor = Assets.Colors.gray3.color
        label.numberOfLines = 0
        return label
    }()
    
    private let appImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Assets.Assets.startAppImage.name)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let onboardingPresentButton : UIButton = {
       let button = UIButton()
        button.setTitle("아침루틴 만들러 가기", for: .normal)
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
        [topLabel, appImage, onboardingPresentButton]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            topLabel.bottomAnchor.constraint(equalTo: appImage.topAnchor, constant: -50),
            
            
            appImage.widthAnchor.constraint(equalToConstant: 120),
            appImage.heightAnchor.constraint(equalToConstant: 120),
            appImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            appImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            onboardingPresentButton.topAnchor.constraint(equalTo: appImage.bottomAnchor, constant: 50),
            onboardingPresentButton.heightAnchor.constraint(equalToConstant: 60),
            onboardingPresentButton.widthAnchor.constraint(equalToConstant: 200),
            onboardingPresentButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }

    
    
    
    
}
