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

// MARK: - Fonts

enum Pretendard {
    static let thin = "Pretendard-Thin"
    static let extraLight = "Pretendard-ExtraLight"
    static let light = "Pretendard-Light"
    static let regular = "Pretendard-Regular"
    static let medium = "Pretendard-Medium"
    static let semiBold = "Pretendard-SemiBold"
    static let bold = "Pretendard-Bold"
    static let extraBold = "Pretendard-ExtraBold"
    static let black = "Pretendard-Black"
}


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
