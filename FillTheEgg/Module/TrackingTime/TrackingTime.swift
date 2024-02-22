//
//  TrackingTime.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/22.
//

import Foundation

final class TrackingTime {
    
    // 싱글톤
    static let shared = TrackingTime()
    private init() {}
    
    /// 현재 날짜 라벨 문자열
    var dateLabel : String {
        return DateFormatter.homeDate.string(from: Date())
    }

    /// 현재 시간 라벨 문자열
    var timeLabel : String {
        return DateFormatter.homeTime.string(from: Date())
    }
    
}
