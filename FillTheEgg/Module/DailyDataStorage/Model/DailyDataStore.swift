//
//  DailyDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/03.
//

import Foundation

final class DailyDataStore : BasicCoreDataStore<DailyDataStorage> {
    //싱글톤
    static let shared = DailyDataStore()
    private override init () {
        super.init()
    }
    
    weak var attendanceCheckData = AttendanceCheckDataStore.shared
    weak var gratitudeJournalData = GratitudeJournalDataStore.shared
    weak var dailyGoalData = DailyGoalDataStore.shared

}

extension DailyDataStore {
    
    /// Create : 새 데이터를 생성
    func create(eggRate : CGFloat) {
        let todayDateString = DateFormatter.forSavingDate.string(from: Date())
        
        //오늘 날짜가 있으면 update -> save , 오늘 날짜가 없으면 create -> save
        if let updateIndex = entities.firstIndex(where: {$0.dateString == todayDateString}) {
            print("update")
            update(dateString: todayDateString, index : updateIndex ,eggRate : eggRate)
            
        }else {
            print("new create")
            let newEntity = DailyDataStorage(context: context)
            newEntity.dateString = todayDateString
    
            addListToEntity(entity: newEntity, eggRate : eggRate)
    
            // 콘텍스트 저장
            saveContext()
        }
        

    }
    
    private func update (dateString : String, index : Int, eggRate : CGFloat) {
        let updateEntity = entities[index]
        addListToEntity(entity: updateEntity, eggRate : eggRate)
        
        // 콘텍스트 저장
        saveContext()
        
    }
    
    private func addListToEntity(entity : DailyDataStorage, eggRate: CGFloat){
        
        entity.eggRate = Float(eggRate)

        for attendance in attendanceCheckData?.list() ?? [] {
            entity.addToAttendanceList(attendance)
        }

        for journal in gratitudeJournalData?.list() ?? [] {
            entity.addToGratitudeJournalList(journal)
        }

        for goal in dailyGoalData?.list() ?? [] {
            entity.addToGoalList(goal)
        }
    }
    
    
}
