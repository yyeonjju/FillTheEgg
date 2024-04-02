//
//  RepositoryView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/29.
//

import UIKit


final class RepositoryView : UIView {
    
    let calendarView = CalendarView()
    
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
        [
            calendarView
        ]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    
}
