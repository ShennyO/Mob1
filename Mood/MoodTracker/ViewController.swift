//
//  ViewController.swift
//  MoodTracker
//
//  Created by Sunny Ouyang on 9/28/17.
//  Copyright © 2017 Sunny Ouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, PersonDelegate, UITableViewDelegate {
   
    
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    var people = [Person]() {
        didSet {
            peopleTableView.reloadData()
        }
    }
    
    func passPerson(person: Person) {
        people.append(person)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: "PersonCell")! as! PersonTableViewCell
        cell.personMoodLabel.text = people[indexPath.row].mood
        cell.personNameLabel.text = people[indexPath.row].name
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            if identifier == "toNewPerson" {
                let personDetailVC = segue.destination as! PersonDetailViewController
                personDetailVC.delegate = self
            } else if identifier == "editPersonMood" {
                let personDetailVC = segue.destination as! PersonDetailViewController
                personDetailVC.delegate = self
                let indexPath = peopleTableView.indexPathForSelectedRow?.row
                personDetailVC.personNameTextField.text = people[indexPath!].name
                personDetailVC.mood = people[indexPath!].mood 
            }
            
        } else {
            return
        }
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

