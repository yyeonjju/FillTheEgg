//
//  ViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewManager = HomeView()
    let trackingTime = TrackingTime.shared
    let timerManager = TimerManager.shared

    
    // MARK: - ViewController LifeCycle
    
    
    //뷰를 메모리에 올리는 과정에 실행
    override func loadView() {
        view = viewManager
    }

    //뷰가 생성되었을 때 한번만 호출
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setupTableView() //테이블뷰 dataSource,delegate, cell 등록
        setupTimer()
        setupEvent()

    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewManager.gratitudeJournalSection.bulletTableView.reloadData()
        viewManager.dailyGoalsSection.bulletChckboxTableView.reloadData()
        
    }

    private func setupTableView() {
        viewManager.gratitudeJournalSection.bulletTableView.dataSource = self
        viewManager.gratitudeJournalSection.bulletTableView.delegate = self
//        viewManager.bulletTableView.rowHeight = 40
        viewManager.gratitudeJournalSection.bulletTableView.register(BulletTableViewCell.self, forCellReuseIdentifier: Cell.bulletCell)
        
        viewManager.dailyGoalsSection.bulletChckboxTableView.dataSource = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.delegate = self
        viewManager.dailyGoalsSection.bulletChckboxTableView.register(BulletCheckboxTableViewCell.self, forCellReuseIdentifier: Cell.bulletCheckboxCell)
    }
    
    // MARK: - Setup Method
    private func setupEvent() {
        viewManager.gratitudeJournalSection.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Event Method
    @objc func addButtonTapped() {
        print("🌸🌸addButtonTapped🌸🌸")
    }
    
    
}



extension HomeViewController {

    func setupTimer() {
        updateDateLabel()
        updateTimeLabel()

        // 1초마다 날짜 및 시간 업데이트 하는 타이머 실행
        timerManager.dateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }

    /// 현재 시간을 기준으로 timeLabel을 설정
    @objc private func updateTimeLabel() {
        viewManager.timeLabel.text = trackingTime.timeLabel

        // 00:00에 날짜 업데이트
        if viewManager.timeLabel.text == "00:00" { updateDateLabel() }
    }

    /// 현재 날짜 및 요일을 기준으로 dateLabel을 설정
    private func updateDateLabel() {
        viewManager.dateLabel.text = trackingTime.dateLabel
    }

}


// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("✅numberOfRowsInSection", gratitudeJournalList.count)
        
        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            return gratitudeJournalList.count
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            return dailyGoalList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("✅cellForRowAt")

        if tableView == viewManager.gratitudeJournalSection.bulletTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
            cell.label.text = gratitudeJournalList[indexPath.row].text
            cell.selectionStyle = .none
            
            return cell
        }
        
        if tableView == viewManager.dailyGoalsSection.bulletChckboxTableView {
            
            print("✅cellForRowAt  dailyGoalsSection")
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.bulletCheckboxCell, for: indexPath) as! BulletCheckboxTableViewCell
            cell.label.text = dailyGoalList[indexPath.row].text
            cell.ckeckbox.isChecked = dailyGoalList[indexPath.row].isDone
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()

    }
    

}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("✅didSelectRowAt")

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
