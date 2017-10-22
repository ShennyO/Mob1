//
//  MonsterTableViewCell.swift
//  Monsters
//
//  Created by Sunny Ouyang on 10/22/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class MonsterTableViewCell: UITableViewCell, sendMonsterDelegate {
    
    
    func sendMonster(monster: Monster) {
        print("The monster you selected is \(monster.name) and it has a power level of \(monster.power)")
//        monster.revealed = true
    }
    

   
    @IBOutlet weak var monsterLabel: UILabel!
    
    
    @IBOutlet weak var powerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
