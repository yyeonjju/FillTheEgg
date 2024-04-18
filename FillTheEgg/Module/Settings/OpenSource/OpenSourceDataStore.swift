//
//  OpenSourceDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import Foundation

struct OpenSource {
    let name: String
    let url: String
}

struct OpenSourceDataStore {
    private let licenses = [
        OpenSource(name: "FSCalendar", url: "https://github.com/WenchaoD/FSCalendar"),
    ]
    
    /// 오픈 라이센스 배열을 반환합니다.
    func list() -> [OpenSource] {
        return licenses
    }
    
    /// 지정한 인덱스의 URL을 반환합니다.
    func fetchURL(to index: Int) -> URL? {
        guard let url = URL(string: licenses[index].url) else { return nil }
        return url
    }
}
