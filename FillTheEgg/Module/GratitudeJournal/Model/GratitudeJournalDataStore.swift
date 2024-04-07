//
//  GratitudeJournalDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/24.
//

import UIKit

// MARK: - properties

final class GratitudeJournalDataStore : BasicCoreDataStore<GratitudeJournal> {
    
    //싱글톤
    static let shared = GratitudeJournalDataStore()
    private override init () {
        super.init()
    }

    override func fetchEntity() {
        super.fetchEntity()
        
        self.todayEntities = entities.filter{$0.dateString == getTodayDateString()}
        print("🍑🍑GratitudeJournalDataStore entities", entities)
        print("🍑🍑GratitudeJournalDataStore todayEntities", todayEntities)
    }
}

// MARK: - Create

extension GratitudeJournalDataStore {
    
    /// Create : 새 데이터를 생성
    func create(text : String) {
        let newEntity = GratitudeJournal(context: context)
        
        newEntity.text = text
        newEntity.order = Int16(entities.count)
        newEntity.dateString = getTodayDateString()
        
        print("newEntity ==> ", newEntity)
        
        // 콘텍스트 저장
        saveContext()
    }
    
}


