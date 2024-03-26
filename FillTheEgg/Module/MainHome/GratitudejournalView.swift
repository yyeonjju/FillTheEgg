//
//  GratitudejournalView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/05.
//

import UIKit

final class GratitudejournalView : UIView {
    
    // MARK: - Component
    private let mainLabel = MainSectionLabel(text: "감사일기")
    var dataList : [GratitudeJournal] = [] {
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
    
    let bulletTableView : AutoResizingTableView = {
        let table = AutoResizingTableView(frame: .zero, style: .plain)
//        table.backgroundColor = Assets.Colors.white.color
        return table
    }()
    
    private let defaultView : BlankView = {
        let view = BlankView(text: BlankViewText.gratitudeJournalHomeViewText)
        
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
            bulletTableView,
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
            
            bulletTableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            bulletTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bulletTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bulletTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
    }
}
