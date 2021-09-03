//
//  GameMakeWordsViewController.swift
//  EasyLearn
//
//  Created by Computer on 22.03.2021.
//

import UIKit
import AVFoundation

class GameMakeWordsViewController: UIViewController {

    var gameMakeWordsModel: GameMakeWordsModel?
    private let dataModel = DataModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var ukrLabel: UILabel!
    @IBOutlet weak var flagButton: UIBarButtonItem!
    
    
    @IBOutlet weak var completeButton: UIButton!

    @IBOutlet weak var clearButton: UIButton!
    
    private var arrayOfCaharectersForCells: [Character]?
    
    private let spacing: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCollectionIdentifierCell")
        
        flagButton.isEnabled = gameMakeWordsModel!.isFlagButtonEnabled()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        engLabel.text = ""
    }
    
    @IBAction func completeButtonPressed(_ sender: UIButton) {
        if let text = engLabel.text, let game = gameMakeWordsModel {
            
            let isCorrect = game.checkIsWordCorrect(userWord: text)
            
            if isCorrect {
                
                if gameMakeWordsModel!.checkIsCategoryDone() {
                    dataModel.updateIsCategoryDoneAndProgress(byIndexOfCategory: game.indexOfCategory)
                    
                    flagButton.isEnabled = gameMakeWordsModel!.isFlagButtonEnabled()
                } else {
                    dataModel.updateUserProgress(byIndexOfCategory: game.indexOfCategory)
                }
                updateLabel()
                collectionView.reloadData()
                informUserAboutCorrectnessWithButtonsColor(informedColor: .green)
                
            } else {
                engLabel.text = "Невірно"
                informUserAboutCorrectnessWithButtonsColor(informedColor: .red)
            }
        }
    }
    
    func updateLabel() {
        if let word = gameMakeWordsModel?.getWandT() {
            ukrLabel.text = word.inUkrainian
            engLabel.text = ""
        } else {
            fatalError("No words for update label, out of index in array")
        }
    }
    
    func informUserAboutCorrectnessWithButtonsColor(informedColor: UIColor) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.clearButton.backgroundColor = UIColor(red: 197, green: 195, blue: 255, alpha: 0)
            self.completeButton.backgroundColor = UIColor(red: 197, green: 195, blue: 255, alpha: 0)
        }
        clearButton.layer.cornerRadius = 10
        completeButton.layer.cornerRadius = 10
        clearButton.backgroundColor = informedColor
        completeButton.backgroundColor = informedColor
    }
}

//MARK: - Collection view data source methods
extension GameMakeWordsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // when reload collection view can prepare some things here
        arrayOfCaharectersForCells = gameMakeWordsModel?.arrayOfShuffledLetters
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionIdentifierCell", for: indexPath) as! CustomCollectionViewCell

        cell.view.layer.cornerRadius = 25

        let indexOfCellsInAllColection = indexPath.item + indexPath.section * 4

        guard let letter = arrayOfCaharectersForCells?[indexOfCellsInAllColection] else {
            fatalError("no letter for collection cell")
        }
        cell.label.text = String(letter)
        return cell
    }
    
}

//MARK: - Collection view delegate methods
extension GameMakeWordsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if engLabel.text == "Невірно" {
            engLabel.text = ""
        }
        
        let currentCell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            currentCell.view.backgroundColor = .white
        }
        currentCell.view.backgroundColor = .gray
        
        if let textCell = currentCell.label.text {
            engLabel.text?.append(textCell)
        }
    }
}
//MARK: - Collection view flow layout delegate methods
extension GameMakeWordsViewController: UICollectionViewDelegateFlowLayout {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfItemsPerRow: CGFloat = 4
        let spacingBetweenCells: CGFloat = 0

        let totalSpasing = (2 * spacing) + (numberOfItemsPerRow - 1) * spacingBetweenCells

        if let collection = self.collectionView {
            let width = (collection.bounds.width - totalSpasing) / numberOfItemsPerRow
            return CGSize(width: width, height: width - 10)
        } else {
            return CGSize(width: 0, height: 0)
        }

    }
}
