//
//  BasicCoreDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/27.
//

import UIKit
import CoreData

class BasicCoreDataStore<T : NSManagedObject> {
    
    init() {
        self.fetchEntity()
    }
    
    /// CoreData Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /// Request
    let fetchReQuest = T.fetchRequest()
    
    ///엔터티 리스트
    var entities: [T] = []
    
    
    
    // MARK: - core data method

    /// 콘텍스트 저장 및 그룹 엔티티를 다시 패치함 -> create, update, delete할 때 호출된다.
    func saveContext() {
        do {
            try context.save()
            fetchEntity()
            
            print("🍑DailyDataStore.shared.list() -> ", DailyDataStore.shared.list())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    /// 그룹 엔티티 패치를 요청
    private func fetchEntity() {
        do {
            entities = try context.fetch(fetchReQuest) as! [T]
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: - Read & Delete
    
    /// Read : 리스트를 반환
    func list() -> [T] {
        return entities
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
