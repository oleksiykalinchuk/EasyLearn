//
//  GameMathModel.swift
//  EasyLearn
//
//  Created by Computer on 01.04.2021.
//

import Foundation

struct GameMathModel {
    
    private let dataModel = DataModel()
    
    init(name: String, words: [WandT], index: Int) {
        categoryName = name
        self.words = words
        indexOfCategory = index
    }
    var categoryName: String
    var words: [WandT]
    var indexOfCategory: Int
    
    private var number1 = 0, number2 = 0
    
    func getWandT() -> WandT? {
        
        if let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory) {
            print(words)
            return words[userProgress]
        }
        return nil
    }
    
    mutating func generateNumbers(min: Int = 1, max: Int = 10, calcMethod: String? = nil) {
        if calcMethod == "/" {
            number2 = Int.random(in: min...max)
            number1 = Int.random(in: min...max)  * number2
            
        }  else {
            number1 = Int.random(in: min...max)
            number2 = Int.random(in: min...max)
        }
    }
    
    mutating func getExample() -> (num1: Int, operation: String, num2: Int) {
        
        switch indexOfCategory {
        case 100:
            return (number1, "+", number2)
        case 101:
            return (number1, "-", number2)
        case 102:
            return (number1, "*", number2)
        case 103:
            return (number1, "/", number2)
        default:
            fatalError("no example for math model")
        }
    }
    
    mutating func checkIsAnswearCorrect(userResult: String, calcMethod: String) -> Bool {
        
        var correctResulString: String
        
        switch calcMethod {
        case "+":
            correctResulString = String(number1 + number2)
        case "-":
            correctResulString = String(number1 - number2)
        case "*":
            correctResulString = String(number1 * number2)
        case "/":
            if number2 == 0 {
                number2 = 1
            }
            if number1 % number2 == 0 {
                correctResulString = String(number1 / number2)
            }
            else {
                //коли робимо з цілими числами, заміняєм кому на крапку (пока це не іспользуєм)
            correctResulString = String(format: "%.1f" , Double(number1) / Double(number2))
            correctResulString = correctResulString.replacingOccurrences(of: ".", with: ",")
            }
        default:
            fatalError("no calc method for checkIsAnswearCorrect math game")
        }
        
        if correctResulString == userResult {
            return true
        }
        return false
    }
    
    func checkIsCategoryDone() -> Bool {
        if let userProgress = dataModel.getUserProgressOfCategory(byIndexOfCategory: indexOfCategory) {
            if userProgress == words.count - 1 {
                return true
            }
        }
        return false
    }
    
}
