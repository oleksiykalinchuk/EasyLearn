//
//  CategoryCell.swift
//  LearnPlaying
//
//  Created by Computer on 17.03.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
