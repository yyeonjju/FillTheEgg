//
//  HomeVC+Timer.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/19.
//

import Foundation

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
