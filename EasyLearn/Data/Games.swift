//
//  Games.swift
//  EasyLearn
//
//  Created by Computer on 22.03.2021.
//

import Foundation
import RealmSwift

class Games: Object {
    @objc dynamic var id = 0
    var gamesCategories = List<GamesCatogories>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
