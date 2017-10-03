//
//  PersonDetailViewController.swift
//  MoodTracker
//
//  Created by Sunny Ouyang on 9/28/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, rowDelegate {
    
    
    
    
    func sendRow(row: Int, person: Person) {
        self.row = row
        self.person = person
    }
    
    
    
    @IBOutlet weak var personNameTextField: UITextField!
    
    
    @IBOutlet weak var MoodSegmentedControl: UISegmentedControl!
    
    //var name: String = ""
        
    var person: Person?
    
    //var mood: String = ""
    
    var row: Int?

    
    var delegate: PersonDelegate?
    
    func checkExisting() {
        switch self.person!.mood {
        case "😁":
        MoodSegmentedControl.selectedSegmentIndex = 0
        case "😐":
        MoodSegmentedControl.selectedSegmentIndex = 1
        case "😡":
        MoodSegmentedControl.selectedSegmentIndex = 2
        default:
        return
        }
        
        if self.person != nil {
            personNameTextField.text = self.person?.name
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.person != nil {
        checkExisting()
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func addNewPerson(_ sender: Any) {
        
        
        if self.person == nil {
        guard let checkName = personNameTextField.text, let checkMood = MoodSegmentedControl.titleForSegment(at: MoodSegmentedControl.selectedSegmentIndex) else {return}
        
        let name = checkName
        let mood = checkMood
       
        
        let person = Person(name: name, mood: mood)
        
        delegate?.passPerson(person: person)
        } else {
            guard let checkName = personNameTextField.text, let checkMood = MoodSegmentedControl.titleForSegment(at: MoodSegmentedControl.selectedSegmentIndex) else {return}
            
            self.person?.mood = checkMood
            self.person?.name = checkName
            
            delegate?.editPerson(person: self.person!, row: self.row!)
            
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
