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
        button.setTitleColor(Assets.Colors.white.color, for: .normal)
        button.titleLabel?.font = FontFamily.Pretendard.semiBold.font(size: 25)
        button.backgroundColor = Assets.Colors.mainYellow.color
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    
    let tableView : AutoResizingTableView = {
        let tableView = AutoResizingTableView()

        return tableView
    }()
    
    private let defaultView : BlankView = {
        let view = BlankView(text: BlankViewText.gratitudeJournalWritingPageText)
        
        return view
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
            addButton,
            tableView,
            defaultView
            
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        [
            textFieldView,
            registerButton,
            addButton,
            tableView,
            defaultView
            
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
            

            //registerButton의 topAnchor 는 defaultView가 뜨냐 tableView가 뜨냐에 따라 다름
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 70)

            
            
        ])
        
        // 데이터가 있는지에 따라서 뷰 보여주기
        if gratitudeJournalList.isEmpty {
            NSLayoutConstraint.activate([
                defaultView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
                defaultView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                
                registerButton.topAnchor.constraint(equalTo: defaultView.bottomAnchor, constant: 30),
            ])
            
        } else {
            defaultView.isHidden = true
            
            NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            registerButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30)
            
            ])
        }
    }
    
}
