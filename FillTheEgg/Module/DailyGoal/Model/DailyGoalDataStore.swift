//
//  DailyGoalDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/27.
//

import UIKit
import CoreData


final class DailyGoalDataStore: BasicCoreDataStore<DailyGoal> {
    
    //싱글톤
    static let shared = DailyGoalDataStore()
    private override init () {
        super.init()
    }

}


// MARK: - Create & Update

extension DailyGoalDataStore {
    
    /// Create : 새 데이터를 생성
    func create(text : String, isDone : Bool = false) {
        let newEntity = DailyGoal(context: context)
        
        newEntity.text = text
        newEntity.isDone = isDone
        newEntity.order = Int16(entities.count)
        
        // 콘텍스트 저장
        saveContext()
    }
    
    ///Uodate : 리스트 중 체크박스 체크 여부  업데이트
    func update(isDone : Bool, index : Int) {
        let goal = entities[index]
        goal.isDone = isDone
        
        saveContext()
    }
    
}
