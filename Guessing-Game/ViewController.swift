//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Kyle Houts on 9/21/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var guessingGameTitle: UILabel!
    
    @IBOutlet weak var guessTextbox: UITextField!
    
    @IBOutlet weak var guessStatusLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var remainingAttemptsLabel: UILabel!
    
    @IBOutlet weak var remainingAttemptsNumber: UILabel!
    
    @IBOutlet weak var resetGameButton: UIButton!
    
    @IBOutlet weak var spinner: UIPickerView!
    
    @IBOutlet weak var losses: UILabel!
    
    @IBOutlet weak var wins: UILabel!
    
    @IBOutlet weak var timesPlayed: UILabel!
    
    @IBOutlet weak var upperValueTextbox: UITextField!
    
    @IBOutlet weak var upperValueLabel: UILabel!
    var getPlayAgainInput: String?
    
    var correctNumber = Int(arc4random_uniform(100)) + 1
    
    var upperValue = 100
    
    var numberOfTries = 8
    
    var numberOfWins = 0
    
    var numberOfLosses = 0
    
    var numberOfTimesPlayed = 0
    
    var backgroundColor: UIColor?
    
    var upperValueInput = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Calling function to hide keyboard
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let color = backgroundColor {
            self.view.backgroundColor = backgroundColor
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func clickSubmitButton(_ sender: Any) {
        
        // TODO:- make sure guessInt won't accept a string
        
        
        guessStatusLabel.text = "Good luck!"
        
        
        
        
        //        if upperValueTextbox == nil {
        //            self.correctNumber == correctNumber
        //        } else if Int(upperValueTextbox!) < 1 || Int(upperValueTextbox!) > 100 {
        //            guessStatusLabel.text = "Please enter an upper value between 1 and 100"
        //        } else if upperValueTextbox.text
        
        
        let upperValueInput = upperValueTextbox.text
        guard let upperValueInt = Int(upperValueInput!) else {
            //They haven't entered a number
            upperValueLabel.text = "Please enter a valid number"
            return
        }
        
        if upperValueInt < 1 || upperValueInt > 100 {
            upperValueLabel.text = "Invalid number entered. Please try again."
            return
        } else {
            var correctNumber = Int(arc4random_uniform(UInt32(upperValueInt)))
        }
        
        
        let input = guessTextbox.text
        guard let guessInt = Int(input!) else {
            //They haven't entered a number
            guessStatusLabel.text = "Please enter a valid number"
            return
        }
        
        if guessInt < 1 || guessInt > 100 {
            guessStatusLabel.text = "Invalid number entered. Please try again."
            return
        }
        
        if numberOfTries > 0 {
            if guessInt == correctNumber {
                numberOfWins += 1
                wins.text = String(numberOfWins)
                guessStatusLabel.textColor = UIColor(hue: 0.35, saturation: 1, brightness: 0.87, alpha: 1.0)
                guessStatusLabel.text = "You win! Click Reset game to play again!"
            } else if guessInt > correctNumber {
                guessStatusLabel.textColor = UIColor(hue: 0.675, saturation: 1, brightness: 0.81, alpha: 1.0)
                numberOfTries -= 1
                remainingAttemptsNumber.text = String(numberOfTries)
                guessStatusLabel.text = "You're guess is too high. You have \(numberOfTries) left"
            } else if guessInt < correctNumber {
                guessStatusLabel.textColor = UIColor(hue: 0.5, saturation: 1, brightness: 0.93, alpha: 1.0)
                numberOfTries -= 1
                remainingAttemptsNumber.text = String(numberOfTries)
                guessStatusLabel.text = "You're guess is too low. You have \(numberOfTries) left"
            }
        } else {
            numberOfLosses += 1
            losses.text = String(numberOfLosses)
            guessStatusLabel.textColor = UIColor(hue: 0.9806, saturation: 1, brightness: 0.93, alpha: 1.0)
            guessStatusLabel.text = "You lose! Click 'reset game' to try again"
        }
        
        numberOfTimesPlayed = numberOfWins + numberOfLosses
        timesPlayed.text = String(numberOfTimesPlayed)
        
    }
    
    
    @IBAction func resetGameButtonPushed(_ sender: Any) {
        numberOfTries = 8
        remainingAttemptsNumber.text = String(numberOfTries)
        guessStatusLabel.text = "Good luck!"
        guessTextbox.text = "Enter a number between 1 and 100"
    }
    
    
    func background0() {
        self.view.backgroundColor = UIColor.blue
    }
    
    
    func background1() {
        self.view.backgroundColor = UIColor.purple
    }
    
    
    
    func background2() {
        self.view.backgroundColor = UIColor.green
    }
    
    
    func background3() {
        self.view.backgroundColor = UIColor.red
    }
    
    
    func background4() {
        self.view.backgroundColor = UIColor.orange
    }
    
}




// Function to hide keyboard when tapped outside of textbox
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}
