//
//  WordsForCategoryViewController.swift
//  LearnPlaying
//
//  Created by Computer on 19.03.2021.
//

import UIKit
import AVKit

//show all words for learning them
class WordsForCategoryViewController: UITableViewController {
    
    //can force unwrap because if it`s nill the app will call fatal error
    var categoryName: String?
    var wordsToLearn: [WandT]?
    var shuffledWords: [WandT]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shuffledWords = wordsToLearn?.shuffled()

        tableView.rowHeight = 80
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        navigationItem.title = categoryName!
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordsToLearn!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CustomCell

        cell.view.layer.cornerRadius = 25
        
        if let word = shuffledWords?[indexPath.row] {
            let resultString = "\(word.inEnglish) - \(word.inUkrainian)"
            cell.label.text = resultString
        }
        
        cell.accessoryType = .none

        return cell
    }
    
    //MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let synthesizer = AVSpeechSynthesizer()
        if let word = shuffledWords?[indexPath.row].inEnglish {
            let utterance = AVSpeechUtterance(string: word)
            utterance.voice = AVSpeechSynthesisVoice(language: "eng-Eng")
            synthesizer.speak(utterance)
        }
        
    }
    
    //MARK: - GO to new game screen
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToGameMakeWords", sender: self)
    }
    
    
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GameMakeWordsViewController
        
        let category = CategoryWordsModel(categoryName: categoryName!)

        guard let index = category.getIndexOfCategory() else {
            fatalError("user progress is equal to nil")
        }
        destinationVC.gameMakeWordsModel = GameMakeWordsModel(words: wordsToLearn!, indexOfCategory: index)
    }
    

}
