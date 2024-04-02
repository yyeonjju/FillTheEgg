//
//  RepositoryViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/29.
//

import UIKit
import FSCalendar

final class RepositoryViewController: UIViewController {
    
    let viewManager = RepositoryView()
    lazy var calendarView = viewManager.calendarView
    
    
    override func loadView() {
        view = viewManager
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendar()
        setupEvent()

    }
    
    // MARK: - methhod
    
    private func setupCalendar() {
        calendarView.calendar.delegate = self
        calendarView.calendar.dataSource = self
        calendarView.calendar.register(CalendarCell.self, forCellReuseIdentifier: Cell.fsCalendarCell)
        
        DispatchQueue.main.async { [weak self] in
            guard let self else{return}
            self.calendarView.calendar.select(Date(), scrollToDate: true)
            self.calendarView.calendarDateLabel.text = DateFormatter.yearDotMonth.string(from: Date())
        }
        
    }
    
    func setupEvent() {
        calendarView.previousButton.addTarget(self, action: #selector(prevCurrentPage), for: .touchUpInside)
        calendarView.nextButton.addTarget(self, action: #selector(nextCurrentPage), for: .touchUpInside)
    }
    
    // 이전 달로 이동 함수
    @objc private func prevCurrentPage() {
        // 이전 달로 달력 전환
        //calendarView.calendar.currentPage에서 -1 한 월로 이동
        guard let previousDate =
                Calendar.current.date(
                    byAdding: .month,
                    value: -1,
                    to: calendarView.calendar.currentPage) else { return }
        calendarView.calendar.setCurrentPage(previousDate, animated: true)

    }
    
    
    // 다음 달로 이동 함수
    @objc private func nextCurrentPage() {
        // 다음 달로 달력 전환
        //calendarView.calendar.currentPage에서 -1 한 월로 이동
        guard let nextDate =
                Calendar.current.date(
                    byAdding: .month,
                    value: 1,
                    to: calendarView.calendar.currentPage) else { return }
        calendarView.calendar.setCurrentPage(nextDate, animated: true)

    }
}

extension RepositoryViewController : FSCalendarDataSource, FSCalendarDelegate {
    
    /// 캘린더 달이 변경될 때마다 호출되는 메서드
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let currentDate = calendar.currentPage

        calendarView.calendarDateLabel.text = DateFormatter.yearDotMonth.string(from: currentDate)
        calendarView.calendar.select(currentDate, scrollToDate: true)
    }
    
    /// FSCalendar 셀을 반환합니다.
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: Cell.fsCalendarCell, for: date, at: position) as! CalendarCell
        let dayText = DateFormatter.day.string(from: date)
        
        cell.eggRateImage.ratio = 0.7
        cell.dateLabel.text = dayText
        cell.selectedDateLabel.text = dayText

        return cell
    }
}
