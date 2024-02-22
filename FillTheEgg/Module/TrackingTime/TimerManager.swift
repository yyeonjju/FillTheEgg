//
//  TimerManager.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/22.
//

import Foundation


final class TimerManager {
    
    /// 싱글톤
    static let shared = TimerManager()
    private init() {}
    
    /// 날짜 타이머
    var dateTimer: Timer!
    
    
}

