//
//  WordsModel.swift
//  LearnPlaying
//
//  Created by Computer on 20.03.2021.
//

import Foundation

struct CategoryWordsModel {
    
    var categoryName: String
    
    func getWordsOfCategory() -> [WandT]? {
        switch categoryName {
        case "Природа - Nature":
            return AllWords.Nature.wordAndTranslate
        case "Сім'я - Family":
            return AllWords.Family.wordAndTranslate
        case "Аксесуари - Accessories":
            return AllWords.Accessories.wordAndTranslate
        case "Зовнішність - Appearance":
            return AllWords.Appearance.wordAndTranslate
        case "Тіло - Body":
            return AllWords.Body.wordAndTranslate
        case "Кольори - Colours":
            return AllWords.Colours.wordAndTranslate
        case "Фрукти - Fruits":
            return AllWords.Fruits.wordAndTranslate
        case "Робота - Job":
            return AllWords.Jobs.wordAndTranslate
        case "Школа - School":
            return AllWords.School.wordAndTranslate
        default:
            return nil
        }
    }
    
    func getIndexOfCategory() -> Int? {
        switch categoryName {
        case "Природа - Nature":
            return AllWords.Nature.indexOfCategory
        case "Сім'я - Family":
            return AllWords.Family.indexOfCategory
        case "Аксесуари - Accessories":
            return AllWords.Accessories.indexOfCategory
        case "Зовнішність - Appearance":
            return AllWords.Appearance.indexOfCategory
        case "Тіло - Body":
            return AllWords.Body.indexOfCategory
        case "Кольори - Colours":
            return AllWords.Colours.indexOfCategory
        case "Фрукти - Fruits":
            return AllWords.Fruits.indexOfCategory
        case "Робота - Job":
            return AllWords.Jobs.indexOfCategory
        case "Школа - School":
            return AllWords.School.indexOfCategory
        default:
            return nil
        }
    }
    
    
    
}
