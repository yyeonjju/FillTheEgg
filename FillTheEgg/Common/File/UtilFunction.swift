//
//  UtilFunction.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/28.
//

import Foundation

// MARK: - Convert Type

public func convertFloatToCGFloat(_ float : Float) -> CGFloat{
    ///두 가지 방법
    let cgFloat = CGFloat(((String(float)) as NSString).doubleValue)
//    let cgFloat = CGFloat(Double(String(float)) ?? 0)
    return cgFloat
}


// MARK: - Date

public func getTodayDateString() -> String {
    return DateFormatter.forSavingDate.string(from: Date())
//    return "2024.04.09"
}
//4.5 40
//4.6 80
//4.7 50
//4.8 100

// MARK: - Calculate Egg Rate

public func calculateEggRate () -> Int {
    let attendanceEntities = AttendanceCheckDataStore.shared.todayList()
    let journalEntities = GratitudeJournalDataStore.shared.todayList()
    let goalEntities = DailyGoalDataStore.shared.todayList()
    
    
    /// 출석체크 전체 점수
    let attendanceTotalPoint = attendanceEntities.isEmpty ? 0 : AdditionalPoint.attendancePoint
    ///감사일기 전체 점수
    let  gratitudeJournalTotalPoint = AdditionalPoint.gratitudeJournalPoint * (journalEntities.count >= 3 ? 3 : journalEntities.count)

    ///완료한 목표
    let completedGoalCount = goalEntities.filter{ $0.isDone }.count
    ///오전목표 전체 점수
    let completedGoalTotalPoint = AdditionalPoint.completedGoalPoint * (completedGoalCount >= 3 ? 3 : completedGoalCount)
    
    return attendanceTotalPoint + gratitudeJournalTotalPoint + completedGoalTotalPoint
}


// MARK: - motivationText

public func returnMotivationText() -> String {
    let attendanceEntities = AttendanceCheckDataStore.shared.todayList()
    let journalEntities = GratitudeJournalDataStore.shared.todayList()
    let goalEntities = DailyGoalDataStore.shared.todayList()
    
    ///출석X
    if attendanceEntities.isEmpty {
        return "출석을 인증하고 \n 오전을 알🥚차게 보내보세요!"
    } else {
        ///출석O

        ///감사일기나 목표 중에서 하나도 안 쓴 항목이 있다면
        if (journalEntities.isEmpty || goalEntities.isEmpty) {
            return "시작이 반이다! 오전 출석 한 것 부터가 대단해요. \n 감사일기와 오전목표도 작성해보세요!"
        } else {
            ///감사일기와 목표를 각각 하나 이상씩 작성했다면
            
            ///3개 미만으로 작성했다면
            if journalEntities.count<3 || goalEntities.count<3 {
                return "감사일기와 오전목표를 각각 3개 이상씩 작성해보세요! \n 열흘이면 30개씩 쌓여요!"
            } else {
                ///감사일기와 목표 모두 3개 이상으로 작성
                
                ///묙표 체크박스 3개 이상 체크(목표 3개 이상 완료)
                if goalEntities.filter({$0.isDone}).count < 3 {
                    return "감사일기와 오전목표를 모두작성하셨군요! \n 목표를 모두 완료하여 알참 지수를 더욱 올려보세요!"
                }else {
                    
                    return "출석과 감사일기, 오전목표를 \n 모두 완료하셨다니! \n 알참지수 100!! 완알🥚"
                }
  
            }
        }
    }
}
