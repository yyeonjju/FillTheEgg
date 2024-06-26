//
//  AttendanceCheckDataStore.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/27.
//

import UIKit
import CoreData


final class AttendanceCheckDataStore : BasicCoreDataStore<AttendanceCheck>{
    
    //싱글톤
    static let shared = AttendanceCheckDataStore()
    private override init () {
        super.init()
    }
    
    override func fetchEntity() {
        super.fetchEntity()
        
        self.todayEntities = entities.filter{$0.dateString == getTodayDateString()}
        
        print("🍑AttendanceCheckDataStore entities", entities)
        print("🍑AttendanceCheckDataStore todayEntities", todayEntities)
    }
    
}


extension AttendanceCheckDataStore {
    
    /// Create : 새 데이터를 생성
    func create(image : UIImage) {
        if todayEntities.isEmpty {
            let newEntity = AttendanceCheck(context: context)
            newEntity.imageData = image.pngData()
            newEntity.dateString = getTodayDateString()

            // 콘텍스트 저장
            saveContext()
        } else {
            update(image: image)
        }
    }
    
    ///Uodate  : 출석체크 데이터는 하나의 요소만 있으면 되므로 index 0에 접근해서 수정
    private func update(image: UIImage) {
        todayEntities[0].imageData = image.pngData()
        todayEntities[0].dateString = getTodayDateString()
        saveContext()
    }
    
}
