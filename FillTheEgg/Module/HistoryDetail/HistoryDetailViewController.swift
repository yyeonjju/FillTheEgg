//
//  HistoryDetailViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/02.
//

import UIKit

final class HistoryDetailViewController: UIViewController {
    let viewManager = HistoryDetailView()
    
    let gratitudeJournalData = GratitudeJournalDataStore.shared
    let dailyGoalData = DailyGoalDataStore.shared
    let attendanceCheckData = AttendanceCheckDataStore.shared
    
    
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //tableView 리로드
        viewManager.gratitudeJournalSection.bulletTableView.reloadData()
        viewManager.dailyGoalsSection.bulletChckboxTableView.reloadData()
        
        //defaultView를 위한 데이터 재할당
        viewManager.gratitudeJournalSection.dataList = gratitudeJournalData.todayList()
        viewManager.dailyGoalsSection.dataList = dailyGoalData.todayList()
        
        //출석 체크 이미지 로딩
        if !attendanceCheckData.todayList().isEmpty {
            guard let imageData = attendanceCheckData.todayList()[0].imageData else {return}
            viewManager.attendCheckSection.photoImageView.image = UIImage(data: imageData)
            viewManager.attendCheckSection.photoLabel.alpha = 0
            viewManager.attendCheckSection.deletePhotoButton.alpha = 1
        }
        
    }
    
    
    
    func setupTableView() {
        viewManager.gratitudeJournalSection.bulletTableView.dataSource = self
        viewManager.gratitudeJournalSection.bulletTableView.delegate = self
//        viewManager.bulletTableView.rowHeight = 40
        viewManager.gratitudeJournalSection.bulletTableView.register(BulletTableViewCell.self, forCellReuseIdentifier: Cell.bulletCell)
        
        viewManager.dailyGoalsSection.bulletChckboxTableView.dataSource = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.delegate = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.register(BulletCheckboxTableViewCell.self, forCellReuseIdentifier: Cell.bulletCheckboxCell)
    }


}


// MARK: - UITableViewDataSource & UITableViewDelegate

extension HistoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
        tableView.isScrollEnabled = false
        
        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let gratitudeJournalList = gratitudeJournalData.todayList()
            return gratitudeJournalList.count
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            let dailyGoalList = dailyGoalData.todayList()
            return dailyGoalList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("✅cellForRowAt")

        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
            let gratitudeJournalList = gratitudeJournalData.todayList()
            
            cell.label.text = gratitudeJournalList[indexPath.row].text
            cell.selectionStyle = .none
            
            return cell
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            
//            print("✅cellForRowAt  dailyGoalsSection")
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCheckboxCell, for: indexPath) as! BulletCheckboxTableViewCell
            let dailyGoalList = dailyGoalData.todayList()
            
            cell.label.text = dailyGoalList[indexPath.row].text
            cell.ckeckbox.isChecked = dailyGoalList[indexPath.row].isDone
            cell.selectionStyle = .none
            
            cell.ckeckbox.isEnabled = false //상세 보기 페이지에서는 read-only
            
            //셀 내부의 체크박스 버튼 눌렀을 때 실행되는 작업 설정
//            configureCheckboxButton(cell: cell, index: indexPath.row)
            
            return cell
        }
        
        return UITableViewCell()

    }
    

}


extension HistoryDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("✅didSelectRowAt")

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
