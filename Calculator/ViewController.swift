//
//  ViewController.swift
//  Calculator
//
//  Created by Arun Rawlani on 5/21/17.
//  Copyright © 2017 Arun Rawlani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false

    @IBAction func touchedButton(_ sender: UIButton){
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

    @IBAction func performOperation(_ sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle{
            if mathematicalSymbol == "π"{
                display.text = String(M_PI)
            }
        }
    }

}

