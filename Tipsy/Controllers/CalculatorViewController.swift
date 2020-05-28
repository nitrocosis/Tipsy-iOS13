//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitTipLabel: UILabel!
    
    var tip = 0.0
    var howManyPeople = 2
    var textFieldInput = 0.0
    var formattedTotal = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPctButton.isSelected = false
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)
        
        sender.isSelected = true
        
        let current = sender.currentTitle!
        
        let currentDropLast =  String(current.dropLast())
        let currentAsNumber = Double(currentDropLast)!
        tip = currentAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        howManyPeople = Int(sender.value)
        splitTipLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let amount = billTextField.text!
        if amount != "" {
            textFieldInput = Double(amount)!
            let total = textFieldInput * (1 + tip) / Double(howManyPeople)
            formattedTotal = String(format: "%.2f", total)
        }
        
        performSegue(withIdentifier: "showResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = howManyPeople
            destinationVC.tipPercentage = Int(tip * 100)
            destinationVC.tipResult = formattedTotal
            
        }
    }
    
}



