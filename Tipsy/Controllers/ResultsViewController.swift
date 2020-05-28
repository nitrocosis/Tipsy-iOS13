//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Sarah Rebecca Estrellado on 5/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipResult = "0.0"
    var numberOfPeople = 10
    var tipPercentage = 2
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = tipResult
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

