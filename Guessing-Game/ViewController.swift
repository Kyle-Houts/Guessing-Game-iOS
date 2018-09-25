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
    
    var getPlayAgainInput: String?
    
    var correctNumber = Int(arc4random_uniform(100)) + 1
    
    var numberOfTries = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func clickSubmitButton(_ sender: Any) {
        
        
        // TODO:- make sure it won't accept a string
        
        guessStatusLabel.text = "Good luck!"
        
        var guessInt: Int? = nil
        
        while guessInt == nil {
            let priorityInput = guessTextbox.text
            guessInt = Int(priorityInput!)
            if let unwrappedGuess = guessInt {
                if unwrappedGuess < 1 || unwrappedGuess > 100 {
                    guessStatusLabel.text = "Please enter a valid number"
                    guessInt = nil
                }
            } else {
                guessStatusLabel.text = "Invalid number entered. Please try again"
            }
        }
        
        if numberOfTries > 0 {
            if guessInt! == correctNumber {
                guessStatusLabel.textColor = UIColor(hue: 0.35, saturation: 1, brightness: 0.87, alpha: 1.0)
                guessStatusLabel.text = "You win! Click Reset game to play again!"
            } else if guessInt! > correctNumber {
                  guessStatusLabel.textColor = UIColor(hue: 0.675, saturation: 1, brightness: 0.81, alpha: 1.0)
                numberOfTries -= 1
                remainingAttemptsNumber.text = String(numberOfTries)
                guessStatusLabel.text = "You're guess is too high. You have \(numberOfTries) left"
            } else if guessInt! < correctNumber {
                guessStatusLabel.textColor = UIColor(hue: 0.5, saturation: 1, brightness: 0.93, alpha: 1.0)
                numberOfTries -= 1
                remainingAttemptsNumber.text = String(numberOfTries)
                guessStatusLabel.text = "You're guess is too low. You have \(numberOfTries) left"
            }
        } else {
            guessStatusLabel.textColor = UIColor(hue: 0.9806, saturation: 1, brightness: 0.93, alpha: 1.0)
            guessStatusLabel.text = "You lose! Click 'reset game' to try again"
        }
    }
    
    
    
    @IBAction func resetGameButtonPushed(_ sender: Any) {
        numberOfTries = 5
        remainingAttemptsNumber.text = String(numberOfTries)
        guessStatusLabel.text = "Good luck!"
        guessTextbox.text = "Enter a number between 1 and 100"
    }
    
    
}
