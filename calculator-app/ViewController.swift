//
//  ViewController.swift
//  calculator-app
//
//  Created by ShahJee on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var calculator = Calculator()
    
    var displayValue: Double? {
        get {
            guard let number = Double(displayString) else {
                return nil
            }
            return number
        }
        
        set {
            let isInt = floor(newValue!) == newValue
            if isInt {
                displayString = String(Int(newValue!))
            } else {
                displayString = String(newValue!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayValue = 0
        shouldClearDisplay = false
    }
    
    var shouldClearDisplay = false
    @IBAction func actionButtonPressed(_ sender: UIButton) {
            shouldClearDisplay = true
            
            calculator.setNumber(displayValue ?? 0)
            if let calcMethod = sender.currentTitle {
                guard let result = calculator.calculate(symbol: calcMethod) else {
                    fatalError()
                }
                displayValue = result
            }
            
            displayLabel.text = displayString
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if shouldClearDisplay {
            displayValue = 0
            shouldClearDisplay = false
        }
        
        if let numValue = sender.currentTitle {
            validateDisplay(numValue)
            displayLabel.text = displayString
        }
    }
    
    var displayString = String()
    func validateDisplay(_ v: String) {
        if v == "." {
            if !displayString.contains(".") {
                displayString.append(v)
            }
        } else {
            displayString.append(v)
            if displayString.count > 1 && displayString.first == "0" && !displayString.contains(".") {
                displayString.removeFirst()
            }
        }
    }
}

