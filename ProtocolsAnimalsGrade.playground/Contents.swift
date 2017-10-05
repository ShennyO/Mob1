
import UIKit
import PlaygroundSupport


// Problem #1
// Modeling Data (Structs, Enums, Classes)
// We want to represent Students and Courses
// Students have a list of courses that they take
// Courses also have a list of students
// Write a function in courses that prints out the names of all the students in a course
// Write an instance of student with a list of courses and an instance of course that has a list of students
// Test out the function in course that prints out its list of students


class Course {
    var name: String
    var students: [Student]
    
    init(name: String) {
        self.name = name
        self.students = []
    }
    
    func printStudents(){
        for student in students {
            print(student.name)
        }
    }
    
}

class Student {
    var name: String
    var courses: [Course]
    
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

let Sunny = Student(name: "Sunny")
let historyClass = Course(name: "history")
historyClass.students.append(Sunny)
historyClass.printStudents()




// Problem #2
// Protocols & Modeling (Structs, Enums, Classes)
/*:
 We need to model different types of Animals in the animal kindom
 a. Animals need to have a species
 b. All Animals need to eat food
 c. Some Animals can Jump, some can Fly
 d. Create instance of 3 animals with different species, some can fly, can jump, some can fly and jump
 e. Put them in an array and print out animals that can only fly
 
 
*/

protocol Animal {
    func eat()
    var canFly: Bool {get set}
    var canJump: Bool {get set}
}

class Tiger: Animal {
    
    var canFly = false
    var canJump = true
    
    func eat() {
        print("I eat food")
    }
    
    func jump() {
        print("I jump high bitch")
    }
    
    
}

class Eagle: Animal, CustomStringConvertible {
    
    var canFly = true
    var canJump = false
    
    func eat() {
        "I eat food"
    }
    
    func fly() {
        "I fly really high up in the sky"
    }
    
    var description: String {
        return "Eagle - can fly"
    }
    
}

class Griffin: Animal, CustomStringConvertible {
    var canFly = true
    var canJump = true
    
    func eat() {
        "I eat food"
    }
    
    func jump() {
        print("I jump high bitch")
    }
    
    func fly() {
        "I fly really high up in the sky"
    }
    
    var description: String {
        return "Griffin - can Fly"
    }
    
}


let Tigger = Tiger()
let hawkEye = Eagle()
let Pomodora = Griffin()

let animalArray: [Animal] = [Tigger, hawkEye, Pomodora]

for animal in animalArray {
    if animal.canFly && animal.canJump == false {
        print(animal)
    }
}


// Delegates Review
/*:
 
*/


//protocol MeansOfCommunicatingBetweenSenderAndReciever {
//    func senderSent(something: String)
//}
//
//struct Sender {
//    var delegate: MeansOfCommunicatingBetweenSenderAndReciever?
//
//    func somethingHappened() {
//        //Some action I want to send
//        delegate?.senderSent(something: "Hey")
//    }
//}
//
//struct Reciever: MeansOfCommunicatingBetweenSenderAndReciever {
//
//    func senderSent(something: String) {
//        print(something)
//    }
//}

//var sender = Sender()
//let reciever = Reciever()
//
//sender.delegate = reciever
//
//sender.somethingHappened()


// Problem #3
/*
 You have a UIView called touchable view that handles a tap.
 a. Write a delegate that delegates the touch action to another view/viewcontroller (SomeViewController)
 
 b. Draw a diagram for the delegation between the TouchableView and the ViewController
*/


protocol toucableDelegate {
    func passTouch()
}

class TouchableView: UIView {
    
    
    var delegate: toucableDelegate?
    
    let touchGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(touchGesture)
        
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        delegate?.passTouch()
    }
}

let touchView = TouchableView(
    frame: CGRect(x: 0, y: 0, width: 100, height: 100)
)

touchView.backgroundColor = UIColor.red

// ViewController that will recieve taps
class SomeViewController: UIViewController, toucableDelegate {
    
    
    func passTouch() {
        print("tapped")
    }
    
    
    
    let touchableView = touchView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.touchableView.delegate = self
    }
}



let vc = SomeViewController()


// Implement Delegation from problem #3


// Extra material to make playground work
PlaygroundPage.current.liveView = touchView
