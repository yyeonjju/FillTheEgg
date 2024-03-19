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
    
    
    private let emailTextField : UITextField = {
       let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .brown
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .emailAddress
        
//        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        
        return textField
    }()
    
    
    private let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("addButton", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    
    
    
    
    // MARK: - Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupInitial() {
        
    }
    
    func setupSubView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [
            emailTextField,
            addButton
            
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        [
            emailTextField,
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
//            contentView.bottomAnchor.constraint(equalTo: dailyGoalsSection.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //contentView는 전체적으로 scrollView대비 양옆 간격 주기
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            
            emailTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            
            addButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30)
            
            
            
            
        ])
    }
    
}
