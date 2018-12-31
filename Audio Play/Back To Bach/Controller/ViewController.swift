//
//  ViewController.swift
//  Back To Bach
//
//  Created by S M HEMEL on 31/12/2018.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()
    
    @objc func updateScrubber() {
        
        scrubber.value = Float(player.currentTime)
        
    }

    @IBAction func play(_ sender: AnyObject) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func volumeChanged(_ sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    
    @IBAction func scrubberMoved(_ sender: AnyObject) {
        
       player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    @IBOutlet var scrubber: UISlider!
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
        
        timer.invalidate()
        
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        
        timer.invalidate()
        
        player.pause()
        
        scrubber.value = 0
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
            // process error
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
            // process error
            
        }
       
    }

}

