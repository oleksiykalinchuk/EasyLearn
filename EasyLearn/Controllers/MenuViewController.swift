//
//  MenuViewController.swift
//  LearnPlaying
//
//  Created by Computer on 16.03.2021.
//

import UIKit

class MenuViewController: UITableViewController {
    
    private let games = ["Склади слово", "Вчимося рахувати"]
    private var currentGame: String = " "

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    
    //MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CustomCell
        
        cell.view.layer.cornerRadius = 25
        cell.label.text = games[indexPath.row]
        cell.accessoryType = .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        
        //animate cell menu but now it is don`t need
//        cell.selectView.isHidden = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            cell.selectView.isHidden = true
//        }
//
        if let gameMode = cell.label.text {
            currentGame = gameMode
            DataModel().loadGameModesToRealm(gameModeName: currentGame)
        }
        
        performSegue(withIdentifier: "goToCategories", sender: self)
    }
    
    //custom new screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! CategoryViewController
        
        guard let categories = GamesModesModel().getGameMode(currentGame: currentGame, games: games) else {
            fatalError("current games categorty is equal nil")
        }
        
        destinationVC.currentGame = currentGame
        destinationVC.categories = categories
        
    }
    

}
