//
//  SettingsDataManager.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/17.
//

import Foundation

struct Setting {
    let name: String
}

struct SettingsDataManager {
    private let usages: [Setting] = [
        Setting(name: "데이터 초기화")
    ]
    
    private let developers: [Setting] = [
        Setting(name: "개발자 정보"),
        Setting(name: "오픈소스")
    ]
    
    // MARK: - Method
    
    /// 일반 설정 데이터를 반환합니다.
    func usageData() -> [Setting] {
        return usages
    }
    
    /// 개발자 설정 데이터를 반환합니다.
    func developerData() -> [Setting] {
        return developers
    }
}
