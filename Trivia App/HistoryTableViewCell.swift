//
//  HistoryTableViewCell.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 11/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var gameAndTime: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var questionOne: UILabel!
    
    @IBOutlet weak var answerOne: UILabel!
    
    @IBOutlet weak var questionTwo: UILabel!
    
    @IBOutlet weak var answerTwo: UILabel!
    
    
    
    
    
    
    

}
