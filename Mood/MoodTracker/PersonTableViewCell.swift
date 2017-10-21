//
//  PersonTableViewCell.swift
//  MoodTracker
//
//  Created by Sunny Ouyang on 9/28/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personMoodLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
