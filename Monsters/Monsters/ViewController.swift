//
//  ViewController.swift
//  Monsters
//
//  Created by Sunny Ouyang on 10/22/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterTableView: UITableView!
    
    var delegate: sendMonsterDelegate?
    //With delegates we have a sender and we have a receiver, receiver conforms to the delegate
    //
    
    let monsterNames: [String] = ["WingedPig", "DiamondDrakes", "ScytheMino", "FlameDino"]
    let colors : [String] = ["Black", "White", "Blue", "Red", "Cyan"]
    
    var monstersArray: [Monster] = [] {
        didSet {
            monsterTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func newMonsterTapped(_ sender: Any) {
        
        let powerLevel = Int(arc4random_uniform(5000))
        let randoNameIndex = Int(arc4random_uniform(UInt32(self.monsterNames.count)))
        let randomColorIndex = Int(arc4random_uniform(UInt32(self.colors.count)))
        
        var newMonster = Monster(power: powerLevel, name: monsterNames[randoNameIndex], color: colors[randomColorIndex],revealed: false)
        monstersArray.append(newMonster)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monstersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = monsterTableView.dequeueReusableCell(withIdentifier: "monsterCell") as! MonsterTableViewCell
        if monstersArray[indexPath.row].revealed == true {
            cell.monsterLabel.text = monstersArray[indexPath.row].name
            cell.powerLabel.text = String(describing: monstersArray[indexPath.row].power)
        } else {
        cell.monsterLabel.text = "Mystery Monster"
        cell.powerLabel.text = "Power"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when we tap the cell, we want to send the index of the cell, (the specific monster) we tapped to our tableview cell.
        let cell = monsterTableView.dequeueReusableCell(withIdentifier: "monsterCell") as! MonsterTableViewCell
        
        self.delegate = cell as! sendMonsterDelegate
        
        var monsterToSend = monstersArray[indexPath.row]
        
        delegate?.sendMonster(monster: monsterToSend)
        self.monstersArray[indexPath.row].revealed = true
        monsterToSend.revealed = true
        self.monsterTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    
    
    
}
