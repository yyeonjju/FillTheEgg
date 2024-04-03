//
//  UserDefaults.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/03.
//

import Foundation


extension UserDefaults {
    var lastVisitDate : String? {
        get{UserDefaults.standard.value(forKey: "lastVisitDate") as? String}
        set{UserDefaults.standard.set(newValue, forKey: "lastVisitDate") }
    }
    
}

