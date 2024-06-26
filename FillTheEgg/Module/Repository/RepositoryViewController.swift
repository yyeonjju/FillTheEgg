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
    lazy var historyView = viewManager.historyView
    
    let attendanceCheckData = AttendanceCheckDataStore.shared
    let gratitudeJournalData = GratitudeJournalDataStore.shared
    let dailyGoalData = DailyGoalDataStore.shared
    let eggRateData = EggRateDataStore.shared
    
    var historyContent : HistoryContent = HistoryContent(attendanceCheckData: [], gratitudeJournalData: [], dailyGoalData: [])
    
    
    override func loadView() {
        view = viewManager
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        
        setupCalendar()
        setupEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ///캘린더 reloadData -> viewWillAppear 때마다 리로드 되면서 calendar.select 동작
        ///-> calendarCellSelected 메서드 동작하면서 historyView도 다시 세팅됨
        calendarView.calendar.reloadData()
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
        
        historyView.showDetailButton.addTarget(self, action: #selector(showDetailButtonTapped), for: .touchUpInside)
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
    
    //자세히 보기 버튼
    @objc private func showDetailButtonTapped(){
        
        let historyDetailVC = HistoryDetailViewController()
        historyDetailVC.hidesBottomBarWhenPushed = true
        historyDetailVC.historyContent = self.historyContent
        navigationController?.pushViewController(historyDetailVC, animated: true)
    }
    
    //날짜 선택에 따른
    private func calendarCellSelected(dateString : String) {
        
        let attendanceArray = attendanceCheckData.list().filter{$0.dateString == dateString}
        historyView.attendanceLabel.text = attendanceArray.isEmpty ?  "- 출석 실패!" :  "- 출석 완료!"
        
        let journalArray = gratitudeJournalData.list().filter{$0.dateString == dateString}
        historyView.graititudeJournalLabel.text = "- 감사일기 \(journalArray.count)개 작성!"
        
        let goalArray = dailyGoalData.list().filter{$0.dateString == dateString}
        let completedGoalArray = goalArray.filter{$0.isDone}
        historyView.dailyGoalLabel.text = "- 오전 목표 \(completedGoalArray.count)개 완료!"
        
        let eggRateArray = eggRateData.list().filter{$0.dateString == dateString}
        if eggRateArray.isEmpty {
            historyView.eggRateImage.ratio = 0.0
        }else {
            historyView.eggRateImage.ratio =  convertFloatToCGFloat(eggRateArray[0].rate)
        }
        
        //HistoryDetailViewController로 넘어갈 데이터 세팅
        self.historyContent = HistoryContent(
            attendanceCheckData: attendanceArray,
            gratitudeJournalData: journalArray,
            dailyGoalData: goalArray
        )
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
        let dayOnlyString = DateFormatter.day.string(from: date)
        let dateString = DateFormatter.forSavingDate.string(from: date)
        let eggRateEntireData = eggRateData.list()

        if let index = eggRateEntireData.firstIndex(where: {$0.dateString == dateString}){
            cell.eggRateImage.ratio = convertFloatToCGFloat(eggRateEntireData[index].rate)
        } else {
            cell.eggRateImage.ratio = 0.0
        }
        
        cell.dateLabel.text = dayOnlyString
        cell.selectedDateLabel.text = dayOnlyString
        cell.cellIsTapped = { [weak self] in
            guard let self else { return }
            self.calendarCellSelected(dateString: dateString)
            
        }

        return cell
    }
}
