//
//  WritingPageView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import UIKit

final class WritingPageView : UIView {
    
    // MARK: - Component
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    
    var contentView: UIView = {
        let view = UIView()
//        view.backgroundColor = .blue
        return view
    }()
    
    let textFieldView : NormalTextFieldView = {
       let form = NormalTextFieldView()
        form.countLabel.text = "0/\(textFieldMaxCount)"
        return form
    }()
    
    private let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(Assets.Colors.gray2.color, for: .normal)
        button.titleLabel?.font = FontFamily.Pretendard.semiBold.font(size: 20)
        
        button.backgroundColor = Assets.Colors.eggWhite.color
        button.layer.cornerRadius = 15

        
        return button
    }()
    
    
    private let registerButton : BasicButton = {
        let button = BasicButton(title: "등록하기", backgroundColor: Assets.Colors.mainYellow.color)
        return button
    }()
    
    
    
    
    
    // MARK: - Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [
            textFieldView,
            registerButton,
            addButton
            
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        [
            textFieldView,
            registerButton,
            addButton
            
        ]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //scrollView
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //스크롤 뷰에 담을 contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //contentView는 전체적으로 scrollView대비 양옆 간격 주기
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            
            textFieldView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            textFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textFieldView.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -10),
            
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 45),
            addButton.heightAnchor.constraint(equalToConstant: 45),
            addButton.centerYAnchor.constraint(equalTo: textFieldView.textField.centerYAnchor),
            
            registerButton.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 70)

            
            
        ])
    }
    
}
