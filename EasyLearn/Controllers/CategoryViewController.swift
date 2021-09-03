//
//  CategoryViewController.swift
//  LearnPlaying
//
//  Created by Computer on 17.03.2021.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    private let dataModel = DataModel()
    
    // can force unwrap because in menu controller we check with guard if it`s nill
    var categories: [String]?
    
    var currentGame: String!
    
    //to explore the category which user selected
    private var selectedCategoty: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        loadCategoriesDataToRealm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        dataModel.resetProgress(byGameName: currentGame)
        loadCategoriesDataToRealm()
        tableView.reloadData()
    }
    
    func loadCategoriesDataToRealm() {
        for i in 0...categories!.count - 1 {
            dataModel.loadCategoriesData(gameModeGame: currentGame, categoryName: categories![i])
        }
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count 
    }

    //MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CustomCell
        
        cell.view.layer.cornerRadius = 25
        cell.label.text = categories![indexPath.row]
        
        cell.accessoryType = isAddCheckmark(indexCell: indexPath.row) ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCategoty = categories?[indexPath.row]
        
        if currentGame == "Склади слово" {
            performSegue(withIdentifier: "goToWordsForCategory", sender: self)
        } else if currentGame == "Вчимося рахувати" {
            performSegue(withIdentifier: "goToMath", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let category = selectedCategoty else {
            fatalError("selected category is equal to nil")
        }
        
        if segue.identifier == "goToWordsForCategory" {
            let destinationVC = segue.destination as! WordsForCategoryViewController
            
            destinationVC.categoryName = category
            
            guard let wordsForCategory = CategoryWordsModel(categoryName: category).getWordsOfCategory() else {
                fatalError("words for game words categoy is equal nil")
            }
            destinationVC.wordsToLearn = wordsForCategory
        } else {
            let destinationVC = segue.destination as! GameMathViewController
            
            guard let wordsForCategory = CategoryMathModel(categoryName: category).getWordsOfCategory() else {
                fatalError("words for game math categoy is equal nil")
            }
            guard let index = CategoryMathModel(categoryName: category).getIndexOfCategory() else {
                fatalError("index of math category is equal nil")
            }
            
            destinationVC.gameMathModel = GameMathModel(name: category, words: wordsForCategory, index: index)
        }
        
    }
    
    func isAddCheckmark(indexCell: Int) -> Bool {
        
        if let indexGame = GamesModesModel().getIndexOfGameMode(byGameModeName: currentGame) {
            if let game = dataModel.getGame(byIndexOfGame: indexGame) {
                
                if game.gamesCategories.count == categories?.count {
                    
                    let isDone = game.gamesCategories[indexCell].isCategoryDone
                    
                    if isDone {
                        return true
                    }
                    
                }
            }
        }
        return false
    }
}
