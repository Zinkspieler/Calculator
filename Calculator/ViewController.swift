//
//  ViewController.swift
//  Calculator
//
//  Created by Nathaniel Cox on 10/6/18.
//  Copyright © 2018 Nathaniel Cox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
 
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var doingOperation: Bool = false
    var mathOperator: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       displayLabel.text = "0"
        
        
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        
        if doingOperation == false {
            if displayLabel.text == "0" {
                displayLabel.text = ""
            }
            displayLabel.text = displayLabel.text! + String(sender.tag-1)
            
        }
        else if doingOperation == true {
            displayLabel.text = String(sender.tag-1)
            doingOperation = false
        }
        
        
    }
    
    @IBAction func mathOperators(_ sender: UIButton) {
        
            firstNumber = Double(displayLabel.text!)!
            doingOperation = true
            
            if sender.tag == 12 {
                mathOperator = "divide"
                
            }
            else if sender.tag == 13 {
                mathOperator = "multiply"
                
            }
            else if sender.tag == 14 {
                mathOperator = "subtract"
                
            }
            else if sender.tag == 15 {
                mathOperator = "add"
               
            }
        
    }
    
    @IBAction func solve(_ sender: UIButton) {
        
        secondNumber = Double(displayLabel.text!)!
        var answer: Double = 0
        
        switch mathOperator {
        case "divide":
            answer = firstNumber/secondNumber
        case "multiply":
            answer = firstNumber*secondNumber
        case "subtract":
            answer = firstNumber-secondNumber
        case "add":
            answer = firstNumber+secondNumber
        default:
            displayLabel.text = ""
        }
        if answer.rounded() == answer {
            displayLabel.text = String(Int(answer))
        }
        else {
            displayLabel.text = String(answer)
        }
        mathOperator = ""
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        displayLabel.text = "0"
        
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        displayLabel.text = displayLabel.text! + "."
        
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        let num = Double(displayLabel.text!)
        if num?.rounded() == num {
            displayLabel.text = String(Int(-num!))
        }
        else {
            displayLabel.text = String(-num!)
        }
        
    }
    
   
}

