//
//  ViewController.swift
//  Guess The Number
//
//  Created by S M HEMEL on 27/10/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var resultShowLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var tryAgainLabel: UIButton!
    @IBOutlet weak var exactSwitch: UISwitch!
    
    var randomNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        randomNumberLabel.text = "Move The Slider To: \(randomNumber)"
        self.title = "Bullseye"
    }
    @IBAction func checkButton(_ sender: Any) {
        if exactSwitch.isOn && Int(numSlider.value) >= randomNumber-5 && Int(numSlider.value) <= randomNumber+5 {
            resultShowLabel.backgroundColor = UIColor.purple
            resultShowLabel.text = "You can pass using exact mode"
        }
        else if Int(numSlider.value) == randomNumber {
            resultShowLabel.backgroundColor = UIColor.green
            resultShowLabel.text = "You were right in point!"
        }
        else {
            resultShowLabel.backgroundColor = UIColor.red
        resultShowLabel.text = "Whoops You missed! Try again later"
        }
        tryAgainLabel.isHidden = false;
        resultShowLabel.isHidden = false;
    }
    @IBAction func sliderValueChanger(_ sender: Any) {
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        tryAgainLabel.isHidden = true
        resultShowLabel.isHidden = true;
        randomNumber = Int(arc4random_uniform(101))
        randomNumberLabel.text = "Move The Slider To: \(randomNumber)"
    }
}

