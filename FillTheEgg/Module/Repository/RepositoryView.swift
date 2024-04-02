//
//  RepositoryView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/29.
//

import UIKit


final class RepositoryView : UIView {
    
    // MARK: - Component
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.gray7.color
        return view
    }()
    
    let calendarView = CalendarView()
    let historyView = HistoryView()
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - method
    private func setupAddSubView () {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            calendarView, historyView
        ]
            .forEach{
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //scrollView
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //스크롤 뷰에 담을 contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: historyView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //contentView는 전체적으로 scrollView대비 양옆 간격 주기
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            
            calendarView.topAnchor.constraint(equalTo: contentView.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            calendarView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            historyView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 10),
            historyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            historyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            historyView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
}
