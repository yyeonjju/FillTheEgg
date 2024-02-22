//
//  HomeView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/20.
//


import UIKit

final class HomeView: UIView {
    
    
    // MARK: - Component
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Pretendard.semiBold.name, size: FontSize.homeViewDate)
        label.textColor = Assets.Colors.gray2.color
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "2월 20일 화요일"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Pretendard.extraBold.name, size: FontSize.homeViewTime)
        label.textColor = Assets.Colors.gray2.color
        label.textAlignment = .left
        label.text = "20:03"
        return label
    }()
    
    let motivationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Pretendard.regular.name, size: FontSize.regular)
        
        label.text = "오늘 하루도 알찬 아침으로 하루를 시작해보세요!"
        
        return label
    }()
    
    let eggRateImage: UIImageView = {
        let imageView = UIImageView()
        //표시될 UIImage 객체 부여
        imageView.image = UIImage(named: Assets.Assets.filledEgg.name)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Assets.Colors.mainYellow.color
        return imageView
    }()
    
    let eggRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Pretendard.regular.name, size: FontSize.regular)
        label.textColor = Assets.Colors.gray2.color
        label.text = "오늘의 알참지수!"
        return label
    }()
    
    
    
    // MARK: - Method



    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInitial() {
        backgroundColor = .white
    }
    
    func setupAddSubView() {
        [ dateLabel, timeLabel, motivationLabel, eggRateImage, eggRateLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints()  {
        NSLayoutConstraint.activate([
            
            // dateLabel
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // 시각 보정
            dateLabel.heightAnchor.constraint(equalToConstant: dateLabel.font.pointSize),
            
            
            // timeLabel
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // 시각 보정
            timeLabel.heightAnchor.constraint(equalToConstant: timeLabel.font.pointSize),
            
            
            // motivationLabel
            motivationLabel.topAnchor.constraint(equalTo: eggRateImage.bottomAnchor, constant: 40),
//            motivationLabel.bottomAnchor.constraint(equalTo: trackingButton.topAnchor),
            motivationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //eggRateLabel
            eggRateLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            eggRateLabel.centerXAnchor.constraint(equalTo: eggRateImage.centerXAnchor),
            eggRateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
//            eggRateLabel.bottomAnchor.constraint(equalTo: eggRateImage.topAnchor, constant: 20),
            
            //eggRateImage
//            eggRateImage.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            eggRateImage.topAnchor.constraint(equalTo: eggRateLabel.bottomAnchor,constant: 10),
//            eggRateImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            eggRateImage.widthAnchor.constraint(equalToConstant: 100),
            eggRateImage.heightAnchor.constraint(equalToConstant: 110),

            
        ])
        
        
    }

}

