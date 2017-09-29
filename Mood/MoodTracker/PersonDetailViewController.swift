//
//  PersonDetailViewController.swift
//  MoodTracker
//
//  Created by Sunny Ouyang on 9/28/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    
    @IBOutlet weak var personNameTextField: UITextField!
    
    
    @IBOutlet weak var MoodSegmentedControl: UISegmentedControl!
    
    var mood: String = "" {
        didSet {
            switch self.mood {
            case "😁":
                MoodSegmentedControl.selectedSegmentIndex = 0
            case "😐":
                MoodSegmentedControl.selectedSegmentIndex = 1
            case "😡":
                MoodSegmentedControl.selectedSegmentIndex = 2
            default:
                return
            
        }
    }
    }
    
    var delegate: PersonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addNewPerson(_ sender: Any) {
        
        guard let checkName = personNameTextField.text, let checkMood = MoodSegmentedControl.titleForSegment(at: MoodSegmentedControl.selectedSegmentIndex) else {return}
        
        let name = checkName
        let mood = checkMood
       
        
        let person = Person(name: name, mood: mood)
        
        delegate?.passPerson(person: person)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
