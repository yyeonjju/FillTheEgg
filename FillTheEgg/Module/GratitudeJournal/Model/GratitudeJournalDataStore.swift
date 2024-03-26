//
//  GratitudeJournalDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/24.
//

import UIKit

// MARK: - properties

final class GratitudeJournalDataStore {
    
    //싱글톤
    static let shared = GratitudeJournalDataStore()
    private init () {
        self.fetchEntity()
    }
    
    /// CoreData Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /// Request
    let fetchReQuest = GratitudeJournal.fetchRequest()
    
    ///엔터티 리스트
    private var entities: [GratitudeJournal] = []
    
    
}



// MARK: - core data method
extension GratitudeJournalDataStore {
    
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
//        // order 속성 기준 오름차순 정렬
//        let sortDescriptor = NSSortDescriptor(key: "order", ascending: true)
//        fetchReQuest.sortDescriptors = [sortDescriptor]
        do {
            entities = try context.fetch(fetchReQuest)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}




// MARK: - CRUD
extension GratitudeJournalDataStore {
    /// Create : 새 데이터를 생성
    func create(text : String) {
        let newEntity = GratitudeJournal(context: context)
        
        newEntity.text = text
        newEntity.order = Int16(entities.count)
        
//        print("❤️❤️❤️create -> newGroup", newEntity)
        
        // 콘텍스트 저장 및 리모트 그룹 초기화
        saveContext()
//        resetRemote()
    }
    
    /// Read : 리스트를 반환
    func list() -> [GratitudeJournal] {
        return entities
    }
    
    ///Uodate : 그룹의 이름을 업데이트합니다. ⭐️아직은 수정하는 기능 없음⭐️
//    func update(text: String, index : Int) {
//        let journal = entities[index]
//        journal.text = text
//
//        saveContext()
//    }
    
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


