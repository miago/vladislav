//
//  AnswerCandidateTableViewCell.swift
//  Vladislav
//
//  Created by Mirco Gysin on 31/07/16.
//  Copyright © 2016 Mirco Gysin. All rights reserved.
//

import UIKit

class AnswerCandidateTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var originButton: UIButton!
    @IBOutlet weak var insertioButton: UIButton!
    @IBOutlet weak var partName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonPressed(sender: UIButton) {
        if(sender == originButton) {
            print("origin button pressed")
        }
        else if(sender == insertioButton) {
            print("insertio button pressed")
        }
    }
}
