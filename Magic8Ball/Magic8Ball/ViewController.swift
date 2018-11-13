//
//  ViewController.swift
//  Magic8Ball
//
//  Created by S M HEMEL on 14/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = ["ball1","ball2", "ball3","ball4","ball5"]
    var imageShow: Int = 0

    @IBOutlet weak var showAnswerLabel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMessage()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        updateMessage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateMessage()
    }
    func updateMessage() {
        let ramdomNumber = Int.random(in: 0...4)
        showAnswerLabel.image = UIImage(named: imageArray[ramdomNumber])
    }
    
}

