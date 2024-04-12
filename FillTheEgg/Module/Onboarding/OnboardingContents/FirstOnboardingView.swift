//
//  FirstOnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class FirstOnboardingView : UIView {
    private let topLabel : UILabel = {
        let label = UILabel()
        label.text = "프리렌서나 대학생이신가요? \n 오전시간이 중요한건 알겠는데 어떻게 해야 \n 알차게 보낼 수 있는지 모르시겠나요?"
        label.textAlignment = .center
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray2.color
        label.numberOfLines = 0
        return label
    }()
    
    let eggRateImage = FilledEggImageView(mode: .withLabel)
    
    private let bottomLabel : UILabel = {
        let label = UILabel()
        label.text = "알찬 하루를 위해서 가장 중요한 아침시간! \n 루틴 만드는 것을 도와드릴게요! "
        label.textAlignment = .center
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray2.color
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - init

    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        eggRateImage.ratio = 1.0
    }
    
    // MARK: - setup

    func setupAddSubView() {
        [topLabel, eggRateImage, bottomLabel]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            
            eggRateImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            eggRateImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            eggRateImage.widthAnchor.constraint(equalToConstant: Size.middleEggWidth),
            eggRateImage.heightAnchor.constraint(equalToConstant: Size.middleEggHeight),
            
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: eggRateImage.bottomAnchor, constant: 40),
        ])
    }

    
}
