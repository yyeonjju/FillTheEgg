//
//  DateFormatter.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/22.
//

import Foundation

extension DateFormatter {
    
    static var year: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter
    }
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        return formatter
    }
    static var day: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }
    
    static var homeDate : DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 E요일"
        return formatter
    }
    
    static var homeTime : DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        return formatter
    }

}
