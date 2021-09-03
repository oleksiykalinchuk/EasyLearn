//
//  DataMathSettings.swift
//  EasyLearn
//
//  Created by Computer on 11.04.2021.
//

import Foundation
import RealmSwift

class DataMathSettings: Object {
    @objc dynamic var calcMethod: String?
    @objc dynamic var minNum: Int = 1
    @objc dynamic var maxNum: Int = 10
    override class func primaryKey() -> String? {
        return "calcMethod"
    }
}
