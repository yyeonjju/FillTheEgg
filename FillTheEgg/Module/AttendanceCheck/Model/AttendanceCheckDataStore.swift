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
    
}


extension AttendanceCheckDataStore {
    
    /// Create : 새 데이터를 생성
    func create(image : UIImage) {

        if entities.isEmpty {
            let newEntity = AttendanceCheck(context: context)
            newEntity.imageData = image.pngData()

            // 콘텍스트 저장
            saveContext()
        } else {
            update(image: image)
        }
    }
    
    ///Uodate  : 출석체크 데이터는 하나의 요소만 있으면 되므로 index 0에 접근해서 수정
    private func update(image: UIImage) {
        entities[0].imageData = image.pngData()
        saveContext()
    }
    
}
