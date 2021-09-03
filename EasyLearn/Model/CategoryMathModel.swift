//
//  CategoryMathModel.swift
//  EasyLearn
//
//  Created by Computer on 07.04.2021.
//

import Foundation

struct CategoryMathModel {
    
    var categoryName: String
    
    private let allWords = AllWords.getAllWords()
    
    func getWordsOfCategory() -> [WandT]? {
        
        let numberOfWordsInCategory = allWords.count / 4
        var range1 = 0, range2 = 0
        
        switch categoryName {
        case "Додавання":
            range1 = 0
            range2 = numberOfWordsInCategory
        case "Віднімання":
            range1 = numberOfWordsInCategory
            range2 = numberOfWordsInCategory * 2
        case "Множення":
            range1 = numberOfWordsInCategory * 2
            range2 = numberOfWordsInCategory * 3
        case "Ділення":
            range1 = numberOfWordsInCategory * 3
            range2 = numberOfWordsInCategory * 4
        default:
            return nil
        }
        
        return Array(allWords[range1..<range2])
    }
    
    func getIndexOfCategory() -> Int? {
        switch categoryName {
        case "Додавання":
            return 100
        case "Віднімання":
            return 101
        case "Множення":
            return 102
        case "Ділення":
            return 103
        default:
            return nil
        }
    }
}
