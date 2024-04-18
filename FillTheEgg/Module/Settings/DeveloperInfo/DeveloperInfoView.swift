//
//  DeveloperInfoView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class DeveloperInfoView  : UIView {
    private let careerTag: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 16)
        label.textColor = Assets.Colors.gray4.color
        label.text = "Career"
        return label
    }()
    
    private let careerValue: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 16)
        label.textColor = Assets.Colors.gray2.color
        label.text = "iOS Developer"
        return label
    }()
    
    private let contactTag: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 16)
        label.textColor = Assets.Colors.gray4.color
        label.text = "Contact"
        return label
    }()
    
    private let contactValue: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 16)
        label.textColor = Assets.Colors.gray2.color
        label.text = "llilyha123@gmail.com"
        return label
    }()
    
    private let githubTag: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 16)
        label.textColor = Assets.Colors.gray4.color
        label.text = "Github"
        return label
    }()
    
    let githubValue: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.semiBold.font(size: 16)
        label.textColor = Assets.Colors.linkBlue.color
        label.text = "https://github.com/yyeonjju"
        label.isUserInteractionEnabled = true
        return label
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
        [
            careerTag,
            careerValue,
            contactTag,
            contactValue,
            githubTag,
            githubValue
            
        ]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            careerTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            careerTag.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            
            careerValue.centerYAnchor.constraint(equalTo: careerTag.centerYAnchor),
            careerValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            contactTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            contactTag.topAnchor.constraint(equalTo: careerTag.bottomAnchor, constant: 30),
            
            contactValue.centerYAnchor.constraint(equalTo: contactTag.centerYAnchor),
            contactValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            githubTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            githubTag.topAnchor.constraint(equalTo: contactTag.bottomAnchor, constant: 30),
            
            githubValue.centerYAnchor.constraint(equalTo: githubTag.centerYAnchor),
            githubValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
    }

}
