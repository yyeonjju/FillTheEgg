//
//  SettingsView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/17.
//

import UIKit

final class SettingsView: UIView {
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    
    var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let tableView : AutoResizingTableView = {
        let tableView = AutoResizingTableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = Assets.Colors.white.color
        return tableView
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
    
    // MARK: - setup

    func setupAddSubView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            tableView
        ]
            .forEach {
                contentView.addSubview($0)
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
            contentView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
        ])
    }

}
