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
    
    static let microEggWidth = 30.0 //calendarView
    static let microEggHeight = microEggWidth * 1.1
    
    static let middleEggWidth = 95.0 //HomeView, historyView
    static let middleEggHeight = middleEggWidth * 1.1
    
    static let bigEggWidth = 110.0 //FirstOnboardingView
    static let bigEggHeight = bigEggWidth * 1.1
    
    static let largePhotoImageWidth = 130.0
    
    static let calendarHeight = 400.0
    
}


// MARK: - Additional Point

enum AdditionalPoint {
    static let attendancePoint = 10 //출석1개당점수
    static let gratitudeJournalPoint = 10 //감사일기1개당점수
    static let completedGoalPoint = 20 //목표 1개완료당 점수
}


// MARK: - MockData

//public struct Journal {
//    let id : Int
//    let text : String
//}
//
//public struct Goal {
//    let id : Int
//    let text : String
//    let isDone : Bool
//}

//public var gratitudeJournalList : [Journal] = [
//    Journal(id: 0, text: "건강하고 행복하게 하루를 시작할 수 있음에 감사합니다."),
//    Journal(id: 1, text: "어제 하루 알차게 일하고 운동까지 해서 개운하게 잠들었음에 감사합니다."),
//    Journal(id: 2, text: "오늘 하루 알차게 보낼 생각으로 설렐 수 있음에 감사합니다."),
//]

//public var dailyGoalList : [Goal] = [
//    Goal(id: 0, text: "블로그 초안 작성하기", isDone: false),
//    Goal(id: 1, text: "카카오톡 답장하기. 연락 쌓이는 거 멈춰!", isDone: true),
//    Goal(id: 2, text: "책 30페이지 이상 읽기", isDone: false),
//]

// MARK: - Cell

enum Cell {
    
    //TableViewCell
    static let bulletCell = "bulletCell"
    static let bulletCheckboxCell = "bulletCheckboxCell"
    static let bulletWithDeleteButtonCell = "bulletWithDeleteButtonCell"
    
    //CalendarCell
    static let fsCalendarCell = "fsCalendarCell"
}

// MARK: - homeView blank text & writingPageView blank text

enum BlankViewText {
    static let gratitudeJournalHomeViewText = "감사일기 3개 작성하기! \n 사소한 것에도 감사함을 느끼는 것 부터가 \n 행복의 시작입니다 :)"
    static let gratitudeJournalWritingPageText = "행복한 하루를 위한 오전 루틴의 시작!\n감사일기 3가지를 등록해보세요!\n\n ex) \n건강하고 행복하게 하루를 시작할 수 있음에 감사합니다. \n 어제하루 알차게 일하고 운동까지 할 수 있었음에 감사합니다."
    static let gratitudeJournalHistoryDetailPageText = "이 날 작성한 감사일기가 없습니다."
    
    static let dailyGoalHomeViewText = "오전목표 단 3개! \n 거창한거 노노. 작은거라도 좋아요. \n 작은 목표를 달성하면서 성취감을 맛보세요 :)"
    static let dailyGoalWritingPageText = "금같은 아침 집중력을 위해\n오전 목표 3가지를 등록해보세요!\n\n ex) \n블로그 초안 작성하기 \n 메신저 답장하기. 연락 쌓이는 거 멈춰!"
    static let dailyGoalHistoryDetailPageText = "이 날 완료한 오전 목표가 없습니다."
}



// etc.

public let textFieldMaxCount = 40
//public let textFeildLabelText = ""


