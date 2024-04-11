//
//  SimpleOnboardingPageView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/11.
//

import UIKit

final class SimpleOnboardingPageView : UIView {
    private let topLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray2.color
        label.numberOfLines = 0
        return label
    }()
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    init(text : String, imageWidth : CGFloat, imageHeight : CGFloat, imageName : String) {
        super.init(frame: .zero)
        
        imageView.image = UIImage(named: imageName)
        topLabel.text = text
        
        setupAddSubView()
        setupConstraints(imageWidth :imageWidth, imageHeight : imageHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAddSubView() {
        [topLabel, imageView]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints(imageWidth : CGFloat, imageHeight : CGFloat) {
        NSLayoutConstraint.activate([
            
            
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            imageView.widthAnchor.constraint(equalToConstant: imageWidth),
//            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            imageView.heightAnchor.constraint(equalToConstant: imageHeight),
 
            
        ])
    
    }

    
}
