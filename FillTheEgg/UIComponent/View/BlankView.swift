//
//  DefaultContentView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import UIKit

final class BlankView : UIView {
    
    // MARK: - Component
    private lazy var defaultView : UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.eggWhite.color
        view.layer.cornerRadius = 20
        view.layer.opacity = 0.7
        return view
    }()

    private let defaultLabel : UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.extraBold.font(size: 15)
        label.textColor = Assets.Colors.white.color
//        label.text = "감사일기 3개! \n 사소한 것에도 감사함을 느끼는 것 부터가 \n 행복의 시작입니다 :)"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - init

    init(frame: CGRect = .zero, text : String) {
        super.init(frame:frame)
        
        defaultLabel.text = text
        
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - method
    
    func setupAutoLayout () {
        [
            defaultView,
            defaultLabel
        ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
        
        NSLayoutConstraint.activate([
            
            defaultView.topAnchor.constraint(equalTo: topAnchor),
            defaultView.widthAnchor.constraint(equalTo: widthAnchor),
            defaultView.heightAnchor.constraint(equalToConstant: 250),
            defaultView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            defaultLabel.centerXAnchor.constraint(equalTo: defaultView.centerXAnchor),
            defaultLabel.centerYAnchor.constraint(equalTo: defaultView.centerYAnchor),
            
        ])
        
        
        
    }
    
    

}

