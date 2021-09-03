//
//  Words.swift
//  LearnPlaying
//
//  Created by Computer on 19.03.2021.
//


import Foundation

struct WandT {
    let inEnglish: String
    let inUkrainian: String
}

struct AllWords {
    
    static let alphabetEng = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                              "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    static func getAllWords() -> [WandT] {
        var words = [WandT]()
        words.append(contentsOf: AllWords.Nature.wordAndTranslate)
        words.append(contentsOf: AllWords.Family.wordAndTranslate)
        words.append(contentsOf: AllWords.Accessories.wordAndTranslate)
        words.append(contentsOf: AllWords.Appearance.wordAndTranslate)
        words.append(contentsOf: AllWords.Body.wordAndTranslate)
        words.append(contentsOf: AllWords.Colours.wordAndTranslate)
        return words
    }
    
    struct Nature {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Tree", inUkrainian: "Дерево"),
                                       WandT(inEnglish: "Sky", inUkrainian: "Небо"),
                                       WandT(inEnglish: "Sun", inUkrainian: "Сонце"),
                                       WandT(inEnglish: "Grass", inUkrainian: "Трава"),
                                       WandT(inEnglish: "Water", inUkrainian: "Вода"),
                                       WandT(inEnglish: "Land", inUkrainian: "Земля"),
                                       WandT(inEnglish: "Animals", inUkrainian: "Тварини"),
                                       WandT(inEnglish: "Flower", inUkrainian: "Квітка"),
                                       WandT(inEnglish: "Bush", inUkrainian: "Кущ"),
                                       WandT(inEnglish: "Leaf", inUkrainian: "Листок"),
                                       WandT(inEnglish: "Rain", inUkrainian: "Дождь"),
                                       WandT(inEnglish: "Snow", inUkrainian: "Сніг"),
                                       WandT(inEnglish: "Earthquake", inUkrainian: "Землетрус")
                                    ]
        static let indexOfCategory = 0
    }
    
    struct Family {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Dad", inUkrainian: "Тато"),
                                       WandT(inEnglish: "Mom", inUkrainian: "Мама")
                                      ]
        static let indexOfCategory = 1
    }
    
    struct Accessories {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Scarf", inUkrainian: "Шарф"),
                                       WandT(inEnglish: "Rucksack", inUkrainian: "Рюкзак"),
                                       WandT(inEnglish: "Hat", inUkrainian: "Шапка"),
                                       WandT(inEnglish: "Necklace", inUkrainian: "Намисто"),
                                       WandT(inEnglish: "Belt", inUkrainian: "Пояс"),
                                       WandT(inEnglish: "Bracelet", inUkrainian: "Браслет"),
                                       WandT(inEnglish: "Gloves", inUkrainian: "Рукавиці"),
                                       WandT(inEnglish: "Glasses", inUkrainian: "Окуляри"),
                                       WandT(inEnglish: "Earrings", inUkrainian: "Сережки"),
                                       WandT(inEnglish: "Pocket", inUkrainian: "Кишеня")
                                    ]
        static let indexOfCategory = 2
    }
    
    struct Appearance {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Beatiful", inUkrainian: "Красива"),
                                       WandT(inEnglish: "Short", inUkrainian: "Низький"),
                                       WandT(inEnglish: "Fat", inUkrainian: "Товстий"),
                                       WandT(inEnglish: "Young", inUkrainian: "Молодий"),
                                       WandT(inEnglish: "Handsome", inUkrainian: "Вродливий"),
                                       WandT(inEnglish: "Old", inUkrainian: "Старий"),
                                       WandT(inEnglish: "Tall", inUkrainian: "Високий"),
                                       WandT(inEnglish: "Slim", inUkrainian: "Худий"),
                                       WandT(inEnglish: "Thin", inUkrainian: "Тонкий")
                                    ]
        static let indexOfCategory = 3
    }
    
    struct Body {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Back", inUkrainian: "Спина"),
                                       WandT(inEnglish: "Nose", inUkrainian: "Ніс"),
                                       WandT(inEnglish: "Leg", inUkrainian: "Нога"),
                                       WandT(inEnglish: "Hand", inUkrainian: "Рука"),
                                       WandT(inEnglish: "Mouth", inUkrainian: "Рот"),
                                       WandT(inEnglish: "Arm", inUkrainian: "Рука"),
                                       WandT(inEnglish: "Ear", inUkrainian: "Вухо"),
                                       WandT(inEnglish: "Throat", inUkrainian: "Горло"),
                                       WandT(inEnglish: "Foot", inUkrainian: "Нога"),
                                       WandT(inEnglish: "Head", inUkrainian: "Голова"),
                                       WandT(inEnglish: "Finger", inUkrainian: "Палець"),
                                       WandT(inEnglish: "Eye", inUkrainian: "Око")
                                    ]
        static let indexOfCategory = 4
    }
    
    struct Colours {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Blue", inUkrainian: "Голубий"),
                                       WandT(inEnglish: "Yellow", inUkrainian: "Жовтий"),
                                       WandT(inEnglish: "Brown", inUkrainian: "Коричневий"),
                                       WandT(inEnglish: "White", inUkrainian: "Білий"),
                                       WandT(inEnglish: "Black", inUkrainian: "Чорний"),
                                       WandT(inEnglish: "Red", inUkrainian: "Червоний"),
                                       WandT(inEnglish: "Green", inUkrainian: "Зелений"),
                                       WandT(inEnglish: "Orange", inUkrainian: "Оранжевий"),
                                       WandT(inEnglish: "Pink", inUkrainian: "Розовий"),
                                       WandT(inEnglish: "Grey", inUkrainian: "Сірий"),
                                    ]
        static let indexOfCategory = 5
    }
    
    struct Fruits {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Strawberry", inUkrainian: "Полуниця"),
                                       WandT(inEnglish: "Apple", inUkrainian: "Яблуко"),
                                       WandT(inEnglish: "Plum", inUkrainian: "Слива"),
                                       WandT(inEnglish: "Grapes", inUkrainian: "Виноград"),
                                       WandT(inEnglish: "Banana", inUkrainian: "Банан"),
                                       WandT(inEnglish: "Peach", inUkrainian: "Персив"),
                                       WandT(inEnglish: "Coconut", inUkrainian: "Кокос"),
                                       WandT(inEnglish: "Mango", inUkrainian: "Манго"),
                                       WandT(inEnglish: "Pineapple", inUkrainian: "Ананас"),
                                       WandT(inEnglish: "Lemon", inUkrainian: "Лемон"),
                                    ]
        static let indexOfCategory = 6
    }
    
    struct Jobs {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Hairdresser", inUkrainian: "Перукар"),
                                       WandT(inEnglish: "Cleaner", inUkrainian: "Прибиральник"),
                                       WandT(inEnglish: "Engineer", inUkrainian: "Інженер"),
                                       WandT(inEnglish: "Lawyer", inUkrainian: "Юрист"),
                                       WandT(inEnglish: "Nurse", inUkrainian: "Медстестра"),
                                       WandT(inEnglish: "Doctor", inUkrainian: "Доктор"),
                                       WandT(inEnglish: "Teacher", inUkrainian: "Вчитель"),
                                       WandT(inEnglish: "Waitress", inUkrainian: "Офіціант"),
                                       WandT(inEnglish: "Driver", inUkrainian: "Водій"),
                                       WandT(inEnglish: "Mechanic", inUkrainian: "Механік"),
                                       WandT(inEnglish: "Manager", inUkrainian: "Менеджер"),
                                       WandT(inEnglish: "Pilot", inUkrainian: "Пілот")
                                    ]
        static let indexOfCategory = 7
    }
    
    struct School {
        
        static let wordAndTranslate = [
                                       WandT(inEnglish: "Board", inUkrainian: "Дошка"),
                                       WandT(inEnglish: "Dictionary", inUkrainian: "Словник"),
                                       WandT(inEnglish: "Shelf", inUkrainian: "Полиця"),
                                       WandT(inEnglish: "Book", inUkrainian: "Книга"),
                                       WandT(inEnglish: "Library", inUkrainian: "Бібліотека"),
                                       WandT(inEnglish: "Teacher", inUkrainian: "Вчитель"),
                                       WandT(inEnglish: "Student", inUkrainian: "Студент"),
                                       WandT(inEnglish: "Pencil", inUkrainian: "Олівець"),
                                       WandT(inEnglish: "Desk", inUkrainian: "Стіл"),
                                       WandT(inEnglish: "Subject", inUkrainian: "Предмет"),
                                    ]
        static let indexOfCategory = 8
    }
}

