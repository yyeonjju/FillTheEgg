//
//  ViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let viewManager = HomeView()
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
        
        setupTimer()
    }
    
    //뷰가 화면에 나타날때마다 계속 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

