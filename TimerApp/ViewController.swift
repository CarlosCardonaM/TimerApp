//
//  ViewController.swift
//  TimerApp
//
//  Created by Carlos Cardona on 08/05/20.
//  Copyright © 2020 D O G. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startStopButton: UIButton!
    
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func updateTimerLabel() {
        counter += 0.1
        timerLabel.text = String(round(counter * 10) / 10)
        
    }
    
    
    @IBAction func startStopDidTouch(_ sender: Any) {
        
        if isStarted {
            
            timer?.invalidate()
            isStarted = false
            startStopButton.setTitle("Start", for: .normal)
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
            
        }
        
    }
    
    
    @IBAction func resetDidTouch(_ sender: Any) {
        
        counter = 0.0
        timerLabel.text = String("0.0")
        
        if isStarted {
            
            timer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            isStarted = false
            
        }
        
        
        
    }
    
    
    

}

