//
//  CalendarView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/29.
//

import UIKit
import FSCalendar

final class CalendarView : UIView {
    
    // MARK: - Properties
    
    let calendarDateLabel : UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.bold.font(size: 25)
        label.textColor = Assets.Colors.gray2.color
        return label
    }()
    
    // 이전 달 이동 버튼
    lazy var previousButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = Assets.Colors.gray3.color
        return button
    }()
    // 다음 달 이동 버튼
    lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = Assets.Colors.gray3.color
        return button
    }()
    
    
    let calendar : FSCalendar = {
        let calendar = FSCalendar()
        //단위
        calendar.scope = .month
        calendar.headerHeight = 0
        calendar.scrollEnabled = false
        
        // 기본 설정
        calendar.placeholderType = .none // 현재 달의 날짜만 표시
        
        //요일 라벨
        calendar.weekdayHeight = 20
        calendar.appearance.weekdayFont = FontFamily.Pretendard.bold.font(size: 15)
        calendar.appearance.weekdayTextColor = Assets.Colors.gray3.color
        
        //날짜 라벨
        calendar.appearance.selectionColor = .none
        calendar.appearance.titleTodayColor = .red //오늘 점 표시(없앰)
        calendar.appearance.todayColor = .clear

        //언어
        calendar.locale = Locale(identifier: "ko_KR") // 월~일
        
        return calendar
    }()
    
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAddSubView()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layout
    private func setupAddSubView () {
        [
            calendar,
            calendarDateLabel,
            previousButton,
            nextButton
        ]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            self.bottomAnchor.constraint(equalTo: calendar.bottomAnchor),
            
            calendarDateLabel.topAnchor.constraint(equalTo: topAnchor),
            calendarDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            previousButton.widthAnchor.constraint(equalToConstant: 25),
            previousButton.heightAnchor.constraint(equalToConstant: 25),
            previousButton.centerYAnchor.constraint(equalTo: calendarDateLabel.centerYAnchor),
            

            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 25),
            nextButton.heightAnchor.constraint(equalToConstant: 25),
            nextButton.centerYAnchor.constraint(equalTo: calendarDateLabel.centerYAnchor),
            
            
            calendar.topAnchor.constraint(equalTo: calendarDateLabel.bottomAnchor, constant: 20),
            calendar.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: Size.calendarHeight)
            
        ])
        
    }
    
    // MARK: - method
    

    
    
}
