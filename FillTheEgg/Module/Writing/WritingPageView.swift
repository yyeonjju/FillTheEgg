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
    
    
    
    private let addButton : BasicButton = {
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
            addButton
            
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        [
            textFieldView,
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
            contentView.bottomAnchor.constraint(equalTo: addButton.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //contentView는 전체적으로 scrollView대비 양옆 간격 주기
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            
            textFieldView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            textFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            
            
            addButton.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 70)
            
            
            
            
        ])
    }
    
}
