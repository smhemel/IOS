//
//  ViewController.swift
//  Calculator
//
//  Created by S M HEMEL on 21/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class MainCalculator: UIViewController {

    @IBOutlet weak var equationTextLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    var equation: String = ""
    var showString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        equationTextLabel.text = "0"
        showString = ""
        equation = ""
        
    }
    @IBAction func allClearButton(_ sender: Any) {
        equation = ""
        showString = ""
        equationTextLabel.text = showString
    }
    @IBAction func ceButton(_ sender: Any) {
        equation = String(equation.dropLast())
        showString = String(showString.dropLast())
        equationTextLabel.text = showString
    }
    @IBAction func zeroButton(_ sender: Any) {
        showString.append("0")
        equationTextLabel.text = showString
        equation.append("0")
    }
    @IBAction func oneButton(_ sender: Any) {
        showString.append("1")
        equationTextLabel.text = showString
        equation.append("1")
    }
    @IBAction func twoButton(_ sender: Any) {
        showString.append("2")
        equationTextLabel.text = showString
        equation.append("2")
    }
    @IBAction func threeButton(_ sender: Any) {
        showString.append("3")
        equationTextLabel.text = showString
        equation.append("3")
    }
    @IBAction func fourButton(_ sender: Any) {
        showString.append("4")
        equationTextLabel.text = showString
        equation.append("4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        showString.append("5")
        equationTextLabel.text = showString
        equation.append("5")
    }
    @IBAction func sixButton(_ sender: Any) {
        showString.append("6")
        equationTextLabel.text = showString
        equation.append("6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        showString.append("7")
        equationTextLabel.text = showString
        equation.append("7")
    }
    @IBAction func eightButton(_ sender: Any) {
        showString.append("8")
        equationTextLabel.text = showString
        equation.append("8")
    }
    @IBAction func nineButton(_ sender: Any) {
        showString.append("9")
        equationTextLabel.text = showString
        equation.append("9")
    }
    @IBAction func pointButton(_ sender: Any) {
        showString.append(".")
        equationTextLabel.text = showString
        equation.append(".")
    }
    @IBAction func persentButton(_ sender: Any) {
        showString.append("%")
        equationTextLabel.text = showString
        equation.append("%")
    }
    @IBAction func rootButton(_ sender: Any) {
        showString.append("")
        equationTextLabel.text = showString
        equation.append("")
    }
    @IBAction func powerButton(_ sender: Any) {
        showString.append("^")
        equationTextLabel.text = showString
        equation.append("^")
    }
    @IBAction func summationButton(_ sender: Any) {
        showString.append("+")
        equationTextLabel.text = showString
        equation.append("+")
    }
    @IBAction func subtractionButton(_ sender: Any) {
        showString.append("-")
        equationTextLabel.text = showString
        equation.append("-")
    }
    @IBAction func multiplicationButton(_ sender: Any) {
        showString.append("X")
        equationTextLabel.text = showString
        equation.append("*")
    }
    @IBAction func divisionButton(_ sender: Any) {
        showString.append("÷")
        equationTextLabel.text = showString
        equation.append("/")
    }
    @IBAction func startBracketButton(_ sender: Any) {
        showString.append("(")
        equationTextLabel.text = showString
        equation.append("(")
    }
    @IBAction func endBracketButton(_ sender: Any) {
        showString.append(")")
        equationTextLabel.text = showString
        equation.append(")")
    }
    @IBAction func resultButtonPressed(_ sender: Any) {
        if equation.count > 0 {
            let lastCharacterOfEquation: String = String(equation.suffix(1))
            if lastCharacterOfEquation == "*" || lastCharacterOfEquation == "+" || lastCharacterOfEquation == "-" || lastCharacterOfEquation == "/" || lastCharacterOfEquation == "^" || lastCharacterOfEquation == "(" || lastCharacterOfEquation == "%" {
                equationTextLabel.text = showString
                resultTextLabel.text = "Incomplete Equation";
            }
            else {
                var usingObjectiveCMethod: Shunting_Yard_Algorithm = Shunting_Yard_Algorithm()
                
                
            }
        }
    }
    

}

