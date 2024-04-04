//
//  HistoryDetailView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/02.
//

import UIKit


final class HistoryDetailView : UIView {
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
    
    let attendCheckSection : AttendanceCheckView = {
        let view = AttendanceCheckView(page: .historyDetailView)

        return view
    }()
    
    lazy var gratitudeJournalSection : GratitudejournalView = {
        let view = GratitudejournalView(page: .historyDetailView)
        return view
    }()
    
    lazy var dailyGoalsSection : DailyGoalsView = {
        let view = DailyGoalsView(page: .historyDetailView)

        return view
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupInitial()
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup

    func setupAddSubView()  {
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [
            attendCheckSection,
            gratitudeJournalSection,
            dailyGoalsSection
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
            contentView.bottomAnchor.constraint(equalTo: dailyGoalsSection.bottomAnchor, constant: 100),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
            
            //attendCheckSection
            attendCheckSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            attendCheckSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            attendCheckSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            attendCheckSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            //gratitudeJournalSection
            gratitudeJournalSection.topAnchor.constraint(equalTo: attendCheckSection.bottomAnchor, constant: 50),
            gratitudeJournalSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gratitudeJournalSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gratitudeJournalSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            //dailyGoalsSection
            dailyGoalsSection.topAnchor.constraint(equalTo: gratitudeJournalSection.bottomAnchor, constant: 50),
            dailyGoalsSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dailyGoalsSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dailyGoalsSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            
            
        ])
    }
    
}
