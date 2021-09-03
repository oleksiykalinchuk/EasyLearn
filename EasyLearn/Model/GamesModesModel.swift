//
//  CategoryModel.swift
//  LearnPlaying
//
//  Created by Computer on 18.03.2021.
//

import Foundation

struct GamesModesModel {
    
    private let categoriesOfWordGame = ["Природа - Nature", "Сім'я - Family",
                                        "Аксесуари - Accessories", "Зовнішність - Appearance", "Тіло - Body",
                                        "Кольори - Colours", "Фрукти - Fruits", "Робота - Job",
                                        "Школа - School"
                                       ]
    private let categoriesOfMathGame = ["Додавання", "Віднімання", "Множення", "Ділення"]
    
    // games contains all games and we have only two games
    func getGameMode(currentGame: String, games: [String]) -> [String]? {
        if currentGame == games[0] {
            return categoriesOfWordGame
        } else if currentGame == games[1] {
            return categoriesOfMathGame
        }
        return nil
    }
    
    func getIndexOfGameMode(byGameModeName name: String) -> Int? {
        switch name {
        case "Склади слово":
            return 0
        case "Вчимося рахувати":
            return 1
        default:
            return nil
        }
    }
}
