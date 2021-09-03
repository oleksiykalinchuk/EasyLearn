//
//  GamesCategories.swift
//  EasyLearn
//
//  Created by Computer on 22.03.2021.
//

import Foundation
import RealmSwift

class GamesCatogories: Object {
    @objc dynamic var indexOfCategory: Int = 0
    @objc dynamic var userProgress: Int = 0
    @objc dynamic var isCategoryDone: Bool = false
    
    override class func primaryKey() -> String? {
        return "indexOfCategory"
    }
}
