//
//  ViewController.swift
//  Calculator
//
//  Created by Arun Rawlani on 5/21/17.
//  Copyright © 2017 Arun Rawlani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false

    @IBAction private func touchedButton(_ sender: UIButton){
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit //can use + to concatenate strings
        }
        else{
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }

    //now we will introduce a COMPUTED PROPERTY
    //FOLLOWING IS AN EXAMPLE OF WHAT A COMPUTED PROPERTY IS
    
    private var displayValue: Double {
        get{
            return Double(display.text!)! //this is sending an optional because it may not be convertible. Double of lets say "Hello" is going to be something undefined.
        }
        set{
            display.text = String(newValue) //newValue is a special keyword
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

