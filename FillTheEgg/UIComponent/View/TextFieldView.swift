//
//  TextField.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/21.
//

import UIKit


final class NormalTextFieldView: UIView {
    
    // MARK: - Component
    
    let formLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = FontFamily.Pretendard.regular.font(size: 16)
        label.textColor = Assets.Colors.gray1.color
        label.textAlignment = .left
        return label
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.gray5.color
        view.clipsToBounds = true
//        view.layer.borderColor = UIColor(rgb: 0xD23939).cgColor
        view.addSubview(contentsStackView)
        return view
    }()
    
    private lazy var contentsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textField, countLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 4
        return stack
    }()
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "감사일기"
        field.font = FontFamily.Pretendard.semiBold.font(size: 16)
        field.textColor = Assets.Colors.black.color
//        field.textColor = .green
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.isSecureTextEntry = false
        return field
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = FontFamily.Pretendard.regular.font(size: 14)
        label.textColor = Assets.Colors.gray2.color
        label.textAlignment = .right
        return label
    }()
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "그룹 내 중복되는 작업명의 블럭은 사용할 수 없어요"
        label.font = FontFamily.Pretendard.regular.font(size: 13)
        label.textColor = .red
        label.textAlignment = .left
        label.alpha = 0
        return label
    }()

    // MARK: - Initial Method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        /// CornerRadius
        backgroundView.layer.cornerRadius = backgroundView.frame.height / 5
    }
    
    /// 경고 라벨 상태 설정 메서드
    func isWarningLabelEnabled(_ bool: Bool) {
        if bool {
            warningLabel.alpha = 1
        }
        else {
            warningLabel.alpha = 0
        }
    }
     
    // MARK: - AutoLayout Method
    
    func setupAddSubView() {
        /// 1. addSubView(component)
        [formLabel, backgroundView, warningLabel]
            .forEach { addSubview($0) }
        
        /// 2. translatesAutoresizingMaskIntoConstraints = false
        [formLabel, backgroundView,
         contentsStackView, textField, countLabel, warningLabel]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    func setupConstraints() {
        /// 3. NSLayoutConstraint.activate
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: warningLabel.bottomAnchor),
            
            formLabel.topAnchor.constraint(equalTo: topAnchor),
            formLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            backgroundView.topAnchor.constraint(equalTo: formLabel.bottomAnchor, constant: 10),

            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 56),
            
            contentsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            contentsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            contentsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
                
            countLabel.widthAnchor.constraint(equalToConstant: 40),
            
            warningLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 4),
            warningLabel.leadingAnchor.constraint(equalTo: formLabel.leadingAnchor)
        ])
        

    }
}
