//
//  SettingViewController.swift
//  Guessing-Game
//
//  Created by Kyle Houts on 9/26/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var selectedColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        selectedColor = UIColor.purple

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var backgroundSelector: UISegmentedControl!
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            destination.backgroundColor = selectedColor
        }
    }

    @IBAction func backgroundSelection(_ sender: Any) {
        if backgroundSelector.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor(hue: 0.7444, saturation: 0.7, brightness: 0.68, alpha: 1.0)
            selectedColor = UIColor(hue: 0.7444, saturation: 0.7, brightness: 0.68, alpha: 1.0)
        } else if
            backgroundSelector.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor(hue: 0.3222, saturation: 0.7, brightness: 0.63, alpha: 1.0)
            selectedColor = UIColor(hue: 0.3222, saturation: 0.7, brightness: 0.63, alpha: 1.0)
        } else if backgroundSelector.selectedSegmentIndex == 2 {
            self.view.backgroundColor = UIColor(hue: 0.8556, saturation: 0.54, brightness: 0.85, alpha: 1.0)
            selectedColor = UIColor(hue: 0.8556, saturation: 0.54, brightness: 0.85, alpha: 1.0)
        } else if backgroundSelector.selectedSegmentIndex == 3 {
            self.view.backgroundColor = UIColor(hue: 0.5389, saturation: 0.69, brightness: 0.72, alpha: 1.0)
            selectedColor = UIColor(hue: 0.5389, saturation: 0.69, brightness: 0.72, alpha: 1.0)
        } else {
            self.view.backgroundColor = UIColor(hue: 0.0583, saturation: 0.69, brightness: 0.82, alpha: 1.0)
            selectedColor = UIColor(hue: 0.0583, saturation: 0.69, brightness: 0.82, alpha: 1.0)
        }
        
    }
}
