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
    
    var dataList : [AnyObject] = []{
        didSet{
            if dataList.isEmpty{
                defaultView.isHidden = false
            } else {
                defaultView.isHidden = true
            }
            
        }
    }
    
    
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
    
    let addButton : UIButton = {
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
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .red
        return tableView
    }()
    
    let defaultView : BlankView = {
        let view = BlankView(text: "")

        return view
    }()
    
//    let registerButton : BasicButton = {
//        let button = BasicButton(title: "등록하기", backgroundColor: Assets.Colors.mainYellow.color)
//        return button
//    }()
    
    // MARK: - Method
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layout
    
    func setupSubView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        [contentView, defaultView]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
        [
            textFieldView,
            addButton,
            tableView,
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        [
            textFieldView,
            addButton,
            tableView,
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
            
            //스크롤 뷰의 subView : contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //스크롤 뷰의 subView : defaultView
            defaultView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
            defaultView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            defaultView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
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

            
            tableView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        
    }
}
