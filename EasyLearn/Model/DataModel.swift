//
//  DataModel.swift
//  EasyLearn
//
//  Created by Computer on 23.03.2021.
//

import Foundation
import RealmSwift

struct DataModel {
    
    var realm = try! Realm()
    var gameModesModel = GamesModesModel()
    
    func loadGameModesToRealm(gameModeName: String) {
        if let index = gameModesModel.getIndexOfGameMode(byGameModeName: gameModeName) {
            //если обьект с таким ключем уже есть в базе даных то уже его не добавляем
            if realm.object(ofType: Games.self, forPrimaryKey: index) != nil {
                return
            }
            
            let game = Games()
            game.id = index
            try! realm.write {
                realm.add(game)
            }
        }
    }
    
    func loadCategoriesData(gameModeGame: String, categoryName: String) {
        
        if let indexOfGameMode = gameModesModel.getIndexOfGameMode(byGameModeName: gameModeGame) {
            var indexOfCategory: Int?
            
            if indexOfGameMode == 0 {
                indexOfCategory = CategoryWordsModel(categoryName: categoryName).getIndexOfCategory()
            } else if indexOfGameMode == 1 {
                indexOfCategory = CategoryMathModel(categoryName: categoryName).getIndexOfCategory()
            }
            
            if let index = indexOfCategory {
                let game = realm.object(ofType: Games.self, forPrimaryKey: indexOfGameMode)
                
                if realm.object(ofType: GamesCatogories.self, forPrimaryKey: index) != nil {
                    return
                }
                try! realm.write {
                    let category = GamesCatogories()
                    category.indexOfCategory = index
                    category.userProgress = 0
                    game?.gamesCategories.append(category)
                }
            }
        }
    }
    
    func resetProgress(byGameName name: String) {
        let index = gameModesModel.getIndexOfGameMode(byGameModeName: name)
        if let game = realm.object(ofType: Games.self, forPrimaryKey: index) {
            
            try! realm.write {
                realm.delete(game.gamesCategories)
            }
        }
    }
    
    func getGame(byIndexOfGame index: Int) -> Games? {
        let game = realm.object(ofType: Games.self, forPrimaryKey: index)
        return game
    }
    
    func getUserProgressOfCategory(byIndexOfCategory index: Int) -> Int? {
        let category = realm.object(ofType: GamesCatogories.self, forPrimaryKey: index)
        return category?.userProgress
    }
    
    func getIsCategoryDone(byIndexOfCategory index: Int) -> Bool {
        let category = realm.object(ofType: GamesCatogories.self, forPrimaryKey: index)
        return category?.isCategoryDone ?? false
    }
    
    func updateUserProgress(byIndexOfCategory index: Int) {
        let category = realm.object(ofType: GamesCatogories.self, forPrimaryKey: index)
        try! realm.write {
            category?.userProgress += 1
        }
    }
    
    func updateIsCategoryDoneAndProgress(byIndexOfCategory index: Int) {
        let category = realm.object(ofType: GamesCatogories.self, forPrimaryKey: index)
        try! realm.write {
            category?.isCategoryDone = true
            category?.userProgress = 0
        }
    }
    
}
