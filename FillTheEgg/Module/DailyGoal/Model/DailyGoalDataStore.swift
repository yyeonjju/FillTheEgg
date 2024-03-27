//
//  DailyGoalDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/27.
//

import UIKit
import CoreData


final class DailyGoalDataStore {
    
    //싱글톤
    static let shared = DailyGoalDataStore()
    private init () {
        self.fetchEntity()
    }
    
    /// CoreData Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /// Request
    let fetchReQuest = DailyGoal.fetchRequest()
    
    ///엔터티 리스트
    private var entities: [DailyGoal] = []

    
}



// MARK: - core data method
extension DailyGoalDataStore{
    /// 콘텍스트 저장 및 그룹 엔티티를 다시 패치함 -> create, update, delete할 때 호출된다.
    func saveContext() {
        do {
            try context.save()
            fetchEntity()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    /// 그룹 엔티티 패치를 요청
    private func fetchEntity() {

        do {
            entities = try context.fetch(fetchReQuest)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

// MARK: - CRUD
extension DailyGoalDataStore {
    /// Create : 새 데이터를 생성
    func create(text : String, isDone : Bool = false) {
        let newEntity = DailyGoal(context: context)
        
        newEntity.text = text
        newEntity.isDone = isDone
        newEntity.order = Int16(entities.count)
        
//        print("❤️❤️❤️create -> newGroup", newEntity)
        
        // 콘텍스트 저장
        saveContext()
    }
    
    /// Read : 리스트를 반환
    func list() -> [DailyGoal] {
        return entities
    }
    
    ///Uodate : 리스트 중 체크박스 체크 여부  업데이트
    func update(isDone : Bool, index : Int) {
        let goal = entities[index]
        goal.isDone = isDone
        
        saveContext()
    }
    
    /// 현재 편집 중인 그룹을 삭제합니다.
    func delete(index : Int) {
        context.delete(entities[index])
        saveContext()
    }
    
    /// 모든 코어데이터를 초기화합니다.
    func resetAllData() {
        
        // 1. 전체 엔티티 삭제
        for entity in self.entities {
            context.delete(entity)
        }
        
        saveContext()
    }
    
}
