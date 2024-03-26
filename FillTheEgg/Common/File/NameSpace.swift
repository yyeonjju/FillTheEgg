//
//  NameSpace.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/14.
//

import UIKit


// MARK: - Version

enum Version {
    static let current = "1.0.0"
}

// MARK: - Font Size

enum FontSize {
    static let small = 14.0
    static let regular = 18.0
    static let big = 25.0
    
    static let homeViewDate = 30.0
    static let homeViewTime = 40.0
    
    static let mainSectionLabel = 25.0
    
}

// MARK: - Size
enum Size {
//    case eggMiddle
//    case eggBig
    
    static let middleEggWidth = 100.0
    static let middleEggHeight = middleEggWidth * 1.1
    
}


// MARK: - MockData

public struct Journal {
    let id : Int
    let text : String
}

public struct Goal {
    let id : Int
    let text : String
    let isDone : Bool
}

//public var gratitudeJournalList : [Journal] = [
//    Journal(id: 0, text: "건강하고 행복하게 하루를 시작할 수 있음에 감사합니다."),
//    Journal(id: 1, text: "어제 하루 알차게 일하고 운동까지 해서 개운하게 잠들었음에 감사합니다."),
//    Journal(id: 2, text: "오늘 하루 알차게 보낼 생각으로 설렐 수 있음에 감사합니다."),
//]

public var dailyGoalList : [Goal] = [
    Goal(id: 0, text: "블로그 초안 작성하기", isDone: false),
    Goal(id: 1, text: "카카오톡 답장하기. 연락 쌓이는 거 멈춰!", isDone: true),
    Goal(id: 2, text: "책 30페이지 이상 읽기", isDone: false),
]

// MARK: - Cell

enum Cell {
    static let bulletCell = "bulletCell"
    static let bulletCheckboxCell = "bulletCheckboxCell"
    static let bulletWithDeleteButtonCell = "bulletWithDeleteButtonCell"
}

// MARK: - homeView blank text & writingPageView blank text

enum BlankViewText {
    static let gratitudeJournalHomeViewText = "감사일기 3개 작성하기! \n 사소한 것에도 감사함을 느끼는 것 부터가 \n 행복의 시작입니다 :)"
    static let gratitudeJournalWritingPageText = "행복한 하루를 위한 오전 루틴의 시작!\n감사일기 3가지를 등록해보세요!\n\n ex) \n건강하고 행복하게 하루를 시작할 수 있음에 감사합니다. \n 어제하루 알차게 일하고 운동까지 할 수 있었음에 감사합니다."
    
    static let dailyGoalHomeViewText = "오전목표 단 3개! \n 거창한거 노노. 작은거라도 좋아요. \n 작은 목표를 달성하면서 성취감을 맛보세요 :)"
    static let dailyGoalWritingPageText = "금같은 아침 집중력을 위해\n오전 목표 3가지를 등록해보세요!\n\n ex) \n블로그 초안 작성하기 \n 메신저 답장하기. 연락 쌓이는 거 멈춰!"
}



// etc.

public let textFieldMaxCount = 40
//public let textFeildLabelText = ""


// MARK: - Fonts

//enum Pretendard {
//    static let thin = "Pretendard-Thin"
//    static let extraLight = "Pretendard-ExtraLight"
//    static let light = "Pretendard-Light"
//    static let regular = "Pretendard-Regular"
//    static let medium = "Pretendard-Medium"
//    static let semiBold = "Pretendard-SemiBold"
//    static let bold = "Pretendard-Bold"
//    static let extraBold = "Pretendard-ExtraBold"
//    static let black = "Pretendard-Black"
//}


// MARK: - Colors
//
//enum Color {
//
//    /// Text Color
//    static let mainText = UIColor(rgb: 0x323232)
//    static let subText = UIColor(rgb: 0x616161)
//    static let subText2 = UIColor(rgb: 0x828282)
//    static let countText = UIColor(rgb: 0x676767)
//    static let disabledText = UIColor(rgb: 0xB2B5BD)
//
//    /// Block Background Color
//    static let entireBlock = UIColor(rgb: 0xE8E8E8)
//    static let contentsBlock = UIColor(rgb: 0xF4F5F7)
//
//    /// Component Color
//    static let seperator = UIColor(rgb: 0xE8E8E8)
//    static let seperator2 = UIColor(rgb: 0xDADADA)
//    static let addBlockButton = UIColor(rgb: 0xC5C5C5)
//    static let cancelButton = UIColor(rgb: 0xF3F3F3)
//    
//    /// EventColor
//    static let danger = UIColor(rgb: 0xD23939)
//    
//    static let defaultBlue = UIColor(rgb: 0x1673FF)
//    static let defaultPink = UIColor(rgb: 0xFF16A2)
//    static let defaultGreen = UIColor(rgb: 0x43D662)
//    static let defaultYellow = UIColor(rgb: 0xFFA216)
//}
//
//extension UIColor {
//
//    /// 16진수를 이용한 UIColor를 생성합니다.
//    ///
//    /// - Parameter red, green, blue: 0~255 사이의 각 컬러 정수값
//    /// - Parameter alpha: 투명도(기본값: 1)
//    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 0xFF) {
//        self.init(
//            red: CGFloat(red) / 255.0,
//            green: CGFloat(green) / 255.0,
//            blue: CGFloat(blue) / 255.0,
//            alpha: CGFloat(alpha) / 255.0
//        )
//    }
//
//    /// 16진수를 이용한 UIColor를 생성합니다.
//    ///
//    /// - Parameter rgb: 16진수(ex: 0x323232)
//    convenience init(rgb: Int) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF
//        )
//    }
//}
