//
//  MathSettingsModel.swift
//  EasyLearn
//
//  Created by Computer on 11.04.2021.
//

import Foundation
import RealmSwift

struct MathSettingsModel {
    
    var realm = try! Realm()
    
    var calcMethod: String
    
    func addNumsToRealm(min: Int = 1, max: Int = 10) {
        let settings = DataMathSettings()
        if realm.object(ofType: DataMathSettings.self, forPrimaryKey: calcMethod) != nil {
            return
        }
        settings.calcMethod = calcMethod
        settings.minNum = min
        settings.maxNum = max
        try! realm.write {
            realm.add(settings)
        }
    }
    
    func updateSettingsNumsInRealm(min: Int, max: Int) {
        if let settings = realm.object(ofType: DataMathSettings.self, forPrimaryKey: calcMethod) {
            try! realm.write {
                settings.minNum = min
                settings.maxNum = max
            }
        }
    }
    
    func getSettingsForCategory() -> DataMathSettings? {
        if let settings = realm.object(ofType: DataMathSettings.self, forPrimaryKey: calcMethod) {
            return settings
        }
        return nil
    }
}
