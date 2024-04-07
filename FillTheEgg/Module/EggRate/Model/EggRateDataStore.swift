//
//  EggRateDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/07.
//

import Foundation

final class EggRateDataStore : BasicCoreDataStore<EggRate>{
    
    //싱글톤
    static let shared = EggRateDataStore()
    private override init () {
        super.init()
    }
    
    override func fetchEntity() {
        super.fetchEntity()
        
        self.todayEntities = entities.filter{$0.dateString == getTodayDateString()}
        
        print("🍑EggRateDataStore entities", entities)
        print("🍑EggRateDataStore todayEntities", todayEntities)
    }
    
}


extension EggRateDataStore {
    
    /// Create : 새 데이터를 생성
    func create(rate : CGFloat) {
        if todayEntities.isEmpty {
            let newEntity = EggRate(context: context)
            newEntity.rate = Float(rate)
            newEntity.dateString = getTodayDateString()

            // 콘텍스트 저장
            saveContext()
        } else {
            update(rate: rate)
        }
    }
    
    ///Uodate  : 출석체크 데이터는 하나의 요소만 있으면 되므로 index 0에 접근해서 수정
    private func update(rate : CGFloat) {
        todayEntities[0].rate = Float(rate)
        todayEntities[0].dateString = getTodayDateString()
        saveContext()
    }
    
}
