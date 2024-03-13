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
        
    }

    private func setupTableView() {
        viewManager.gratitudeJournalSection.bulletTableView.dataSource = self
        viewManager.gratitudeJournalSection.bulletTableView.delegate = self
//        viewManager.bulletTableView.rowHeight = 40
        viewManager.gratitudeJournalSection.bulletTableView.register(BulletTableViewCell.self, forCellReuseIdentifier: Cell.bulletCell)
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
        return gratitudeJournalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("✅cellForRowAt")
        let cell = viewManager.gratitudeJournalSection.bulletTableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell

        cell.label.text = gratitudeJournalList[indexPath.row].text
        cell.selectionStyle = .none
        return cell
    }
    
    //cell마다 height 다르게해주려면 - cell에 들어가는 label의 line 개수를 구해서 그것과 비례하게?
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        // indexPath를 기반으로 각 셀의 높이를 결정합니다.
////        // 예를 들어, 첫 번째 섹션의 첫 번째 행은 50, 두 번째 행은 60으로 설정할 수 있습니다.
////        if indexPath.section == 0 {
////            if indexPath.row == 0 {
////                return 50
////            } else if indexPath.row == 1 {
////                return 150
////            }
////            // 그 외의 경우에는 기본 높이를 반환할 수 있습니다.
////        }
////
////        // 기본 높이를 반환하거나 다른 조건에 따라 높이를 결정할 수 있습니다.
////        return UITableView.automaticDimension // 기본 높이를 사용하거나 다른 조건에 따라 적절한 높이를 반환합니다.
//        
////        let cell = viewManager.gratitudeJournalSection.bulletTableView.dequeueReusableCell(withIdentifier: Cell.bulletCell, for: indexPath) as! BulletTableViewCell
////        print("🌸heightForRowAt🌸", cell.label.frame.height)
//        print("🌸heightForRowAt🌸")
//        
//        return 100
//    }
    

}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("✅didSelectRowAt")

    }
}
