//
//  GameMakeWordsModel.swift
//  EasyLearn
//
//  Created by Computer on 22.03.2021.
//

import Foundation

struct GameMakeWordsModel {
    
    private let dataModel = DataModel()
    
    let words: [WandT]
    var indexOfCategory: Int
    
    private let numberOfCellInColectionView = 16
    
    //contains current word with random letters
    var arrayOfShuffledLetters: [Character]? {
        get {
            if let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory) {

                var arr = [Character]()
                
                let currentWord = words[userProgress].inEnglish
                
                //потім можна буде зробити щоб діапазон був динамічний і не було межі в 16 букв
                
                arr.append(contentsOf: currentWord)
                
                for _ in currentWord.count+1 ... 16 {
                    let randNum = Int.random(in: 0...AllWords.alphabetEng.count - 1)
                    let char = Character(AllWords.alphabetEng[randNum])
                    arr.append(char)
                }
                
                let result = arr.shuffled()
                
                return result
            }
            return nil
        }
    }
    
    func getWandT() -> WandT? {
        
        if let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory) {
            return words[userProgress]
        }
        return nil
    }
    
    func checkIsWordCorrect(userWord: String) -> Bool {
        let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory)!
        
        if userWord == words[userProgress].inEnglish {
            return true
        }
        return false
    }
    
    func checkIsCategoryDone() -> Bool {
        let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory)!
        
        if userProgress == words.count - 1 {
            return true
        }
        return false
    }
    
    func isFlagButtonEnabled() -> Bool{
        let isCategoryDone = dataModel.getIsCategoryDone(byIndexOfCategory: indexOfCategory)
        if isCategoryDone {
            return true
        }
        return false
    }
    
}
