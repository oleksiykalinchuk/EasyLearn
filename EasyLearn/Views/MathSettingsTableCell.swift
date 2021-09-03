//
//  MathSettingsTableCell.swift
//  EasyLearn
//
//  Created by Computer on 11.04.2021.
//

import UIKit

class MathSettingsTableCell: UITableViewCell {
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func steppedPressed(_ sender: UIStepper) {
        textField.text = Int(stepper.value).description
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        stepper.minimumValue = 0
        stepper.maximumValue = 10000
    }

    
}
