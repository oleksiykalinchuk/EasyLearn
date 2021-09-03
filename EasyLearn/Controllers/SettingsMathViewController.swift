//
//  SettingsViewController.swift
//  EasyLearn
//
//  Created by Computer on 11.04.2021.
//

import UIKit

class SettingsMathViewController: UITableViewController {
    
    private let settingsCellText = ["Від такого числа:", "До такого числа:"]
    private let defaultNumbers = ["1", "10"]
    
    var mathSettingsModel: MathSettingsModel!
    private var minNumber: Int?
    private var maxNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 120
        tableView.register(UINib(nibName: "MathSettingsTableCell", bundle: nil), forCellReuseIdentifier: "mathSettingsCellIdentifier")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        setNumberWithCellData(сellAtRow: 0, сellAtSection: 0)
        setNumberWithCellData(сellAtRow: 1, сellAtSection: 0)
        
        if var min = minNumber, var max = maxNumber {
            if min > max {
                min = 1
                max = 10
            }
            mathSettingsModel.updateSettingsNumsInRealm(min: min, max: max)
        }
    }
    
    func setNumberWithCellData(сellAtRow row: Int, сellAtSection section: Int) {
        
        let indexPath = IndexPath(row: row, section: section)
        
        let cell = tableView.cellForRow(at: indexPath) as! MathSettingsTableCell
        
        if row == 0, section == 0 {
            minNumber = Int(cell.textField?.text ?? "1")
        } else {
            maxNumber = Int(cell.textField?.text ?? "10")
        }
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsCellText.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathSettingsCellIdentifier", for: indexPath) as! MathSettingsTableCell
        
        cell.label.text = settingsCellText[indexPath.row]
        
        if let settings = mathSettingsModel.getSettingsForCategory() {
            
           
            if indexPath.row == 0 {
                cell.textField.text = String(settings.minNum)
            } else {
                cell.textField.text = String(settings.maxNum)
            }
            
            cell.stepper.value = Double(cell.textField.text ?? "")!
            
            if let numberOfTextField = Int(cell.textField.text ?? "") {
                
                if indexPath.row == 0 {
                    minNumber = numberOfTextField
                } else {
                    maxNumber = numberOfTextField
                }
            }
            
        } else {
            cell.stepper.value = Double(defaultNumbers[indexPath.row])!
            cell.textField.text = defaultNumbers[indexPath.row]
            
            if indexPath.row == 0 {
                minNumber = Int(defaultNumbers[indexPath.row])!
            } else {
                maxNumber = Int(defaultNumbers[indexPath.row])!
            }
            
            if let minNum = minNumber, let maxNum = maxNumber {
                mathSettingsModel.addNumsToRealm(min: minNum, max: maxNum)
            }
        }
        
        return cell
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
