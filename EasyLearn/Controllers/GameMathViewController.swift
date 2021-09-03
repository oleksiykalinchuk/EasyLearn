//
//  GameMathViewController.swift
//  EasyLearn
//
//  Created by Computer on 30.03.2021.
//

import UIKit
import AVFoundation

class GameMathViewController: UIViewController {
    
    var gameMathModel: GameMathModel!
    var dataModel = DataModel()
    private let bar = UIToolbar()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var ukrLabel: UILabel!
    
    @IBOutlet weak var engLabel: UILabel!
    
    private var example: (num1: Int, operation: String, num2: Int)?
    private var wordCounter: Int = 0
    
    private let spacing: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "MathCollectionCell", bundle: nil), forCellWithReuseIdentifier: "mathIdentifierCell")
        
        navigationItem.title = gameMathModel.categoryName
        
        initLabelWithEmptyString()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
        
        setupToolbar()
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToMathSetting", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! UINavigationController
        let destination = destinationVC.viewControllers[0] as! SettingsMathViewController
        if let calcMethod = example?.operation {
            destination.mathSettingsModel = MathSettingsModel(calcMethod: calcMethod)
        }
    }
    
    func setupToolbar(){
        //Create a toolbar
        bar.backgroundColor = .white
        //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneBtnPressed))
        doneBtn.tintColor = .black
        
        let plusMinusBtn = UIBarButtonItem(title: "+/-", style: .plain, target: self, action: #selector(plusMinusButtonPressed))
        plusMinusBtn.tintColor = .black
        
        //Create a felxible space item so that we can add it around in toolbar to position our done button
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Add the created button items in the toobar
        bar.items = [plusMinusBtn, flexSpace, doneBtn]
        bar.sizeToFit()
        
        //Add the toolbar to our textfield
        textField.inputAccessoryView = bar
    }
    
    @objc func doneBtnPressed() {
        if let text = textField.text, let operation = example?.operation {
            if gameMathModel.checkIsAnswearCorrect(userResult: text, calcMethod: operation) {
                
                if gameMathModel.checkIsCategoryDone() {
                    dataModel.updateIsCategoryDoneAndProgress(byIndexOfCategory: gameMathModel.indexOfCategory)
                }
                
                updateLabel()
                
                collectionView.reloadData()
                
                textField.text = ""
                //wrong answear with positive sound 1301 1054 1022
                informUserAboutAnswearWithSoundAndColour(soundID: 0, defaultColour: .white, infromColour: .green)
                
            } else {
                //wrong answear with negative sound 1053 4095
                informUserAboutAnswearWithSoundAndColour(soundID: 1053, defaultColour: .white, infromColour: .red)
            }
        }
    }
    
    @objc func plusMinusButtonPressed() {
        if textField.text == "" {
            textField.text?.append("-")
        } else if textField.text == "-" {
            textField.text = ""
        }
    }
    
    func informUserAboutAnswearWithSoundAndColour(soundID: SystemSoundID, defaultColour: UIColor, infromColour: UIColor) {
        let systemSoundID: SystemSoundID = soundID
        AudioServicesPlaySystemSound(systemSoundID)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.bar.backgroundColor = defaultColour
        }
        bar.backgroundColor = infromColour
    }
    
    func updateLabel() {
        
        if let word = gameMathModel.getWandT() {
            
            if engLabel.text != "" {
                initLabelWithEmptyString()
            }
            
            let index = word.inUkrainian.index(word.inUkrainian.startIndex, offsetBy: wordCounter)
            ukrLabel.text?.append(word.inUkrainian[index])
            wordCounter += 1
            
            if wordCounter == word.inUkrainian.count {
                dataModel.updateUserProgress(byIndexOfCategory: gameMathModel.indexOfCategory)
                wordCounter = 0
                engLabel.text = word.inEnglish
            }
            
        } else {
            fatalError("No words for update label math, out of index in array")
        }
        
    }
    
    func initLabelWithEmptyString() {
        engLabel.text = ""
        ukrLabel.text = ""
    }
    
    func initExampleWithSettings() {
        example = gameMathModel.getExample()
        
        if let settings = MathSettingsModel(calcMethod: example!.operation).getSettingsForCategory() {
            gameMathModel.generateNumbers(min: settings.minNum, max: settings.maxNum, calcMethod: settings.calcMethod)
        } else {
            gameMathModel.generateNumbers()
        }
        
        example = gameMathModel.getExample()
    }

}

//MARK: - Collection View Data Source Methods
extension GameMathViewController: UICollectionViewDataSource {
    
    // init numbers when collection view reload
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        initExampleWithSettings()
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "mathIdentifierCell", for: indexPath) as! MathCollectionCell

        cell.layer.cornerRadius = 25
        
        if let example = example {
            if indexPath.row == 0 {
                cell.label.text = String(example.num1)
            } else if indexPath.row == 1 {
                cell.label.text = example.operation
            } else if indexPath.row == 2 {
                cell.label.text = String(example.num2)
            }
        }
        
        return cell
    }
}

//MARK: - Collection View Delegate Layout Methods
extension GameMathViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numberOfItemsPerRow:CGFloat = 3
            let spacingBetweenCells:CGFloat = 16
            
            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
            
            if let collection = self.collectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width-5)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
}
