//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Kyle Houts on 9/21/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    
    @IBOutlet weak var guessNumberTextbox: UITextField!
    
    @IBOutlet weak var guessStatusLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var remainingAttemptsLabel: UILabel!
    
    @IBOutlet weak var remainingAttemptsNumber: UILabel!
    
    @IBOutlet weak var resetGameButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

