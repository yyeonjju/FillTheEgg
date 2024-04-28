//
//  ConfirmModalView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/28.
//

import UIKit

final class ConfirmModalView : UIView {
    
    let backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.black.color
        view.layer.opacity = 0.4
        return view
    }()
    
    private let modalView : UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.white.color
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    let mainLabel : UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.semiBold.font(size: 16)
        label.textColor = Assets.Colors.gray1.color
        label.text = "mainLabel"
        return label
    }()
    
    let subLabel : UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.semiBold.font(size: 16)
        label.textColor = Assets.Colors.gray3.color
        label.text = "subLabel"
        return label
    }()
    
    let buttonsStackView : ActionButtonsStackView = {
        let view = ActionButtonsStackView()
//        view.backgroundColor = Assets.Colors.warningRed.color
        return view
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
    
    // MARK: - method
    
    func setupAddSubView() {
        [backgroundView, modalView]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [mainLabel, subLabel, buttonsStackView]
            .forEach{
                modalView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            modalView.centerYAnchor.constraint(equalTo: centerYAnchor),
            modalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            modalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            modalView.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 40),
            
            mainLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -30),
            mainLabel.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 40),
            
            subLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 30),
            subLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -30),
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -30),
            buttonsStackView.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 30),
//            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            
            
            
        ])
    }

    
    
    
}
