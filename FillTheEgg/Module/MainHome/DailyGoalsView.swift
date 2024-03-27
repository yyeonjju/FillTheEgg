//
//  DailyGoalsView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class DailyGoalsView : UIView {
    
    // MARK: - Component
    private let mainLabel = MainSectionLabel(text: "오전목표")
    var dataList : [DailyGoal] = [] {
        didSet{
            if dataList.isEmpty{
                defaultView.isHidden = false
                setupDefaultViewConstraints()
            } else {
                defaultView.isHidden = true
                setupTableViewConstraints()
            }
            
        }
    }
    
    lazy var bottomAnchorContraintsEqualToContentView =  self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    lazy var bottomAnchorContraintsEqualToDefaultView =  self.bottomAnchor.constraint(equalTo: defaultView.bottomAnchor)
    
    var contentView: UIView = {
        let view = UIView()
//        view.backgroundColor = .blue
        return view
    }()
    
    
    let addButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "작성하기", color: Assets.Colors.gray3.color, borderColor: Assets.Colors.gray3.color.cgColor)
        
        return btn
    }()

    let bulletChckboxTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .plain)
//        table.backgroundColor = Assets.Colors.white.color
        return table
    }()
    
    private let defaultView : BlankView = {
        let view = BlankView(text: BlankViewText.dailyGoalHomeViewText)
        
        return view
    }()

    

    
    // MARK: - Initial Method

    
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
        [
            contentView,
            defaultView
        ]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [
            mainLabel,
            addButton,
            bulletChckboxTableView,
        ]
            .forEach {
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    
    func setupDefaultViewConstraints() {
        
        DispatchQueue.main.async{[weak self] in
            guard let self = self else {return }
            NSLayoutConstraint.deactivate([
                self.bottomAnchorContraintsEqualToContentView
            ])
            NSLayoutConstraint.activate([
                self.bottomAnchorContraintsEqualToDefaultView
            ])
            
            //작성페이지로 이동하는 버튼 타이틀 변경
            self.addButton.setTitle("작성하기", for: .normal)
        }
    }
    
    func setupTableViewConstraints() {
        DispatchQueue.main.async{[weak self] in
            guard let self = self else {return }
            NSLayoutConstraint.deactivate([
                self.bottomAnchorContraintsEqualToDefaultView
            ])
            NSLayoutConstraint.activate([
                self.bottomAnchorContraintsEqualToContentView
            ])
            
            //작성페이지로 이동하는 버튼 타이틀 변경
            self.addButton.setTitle("수정하기", for: .normal)
        }
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            bottomAnchor.constraint(greaterThanOrEqualTo:contentView.bottomAnchor),
            
            defaultView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            defaultView.leadingAnchor.constraint(equalTo: leadingAnchor),
            defaultView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            
            bulletChckboxTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            bulletChckboxTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bulletChckboxTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bulletChckboxTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
    }
    
    
}
