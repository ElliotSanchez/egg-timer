//
//  ViewController.swift
//  egg-timer
//
//  Created by hostname on 11/14/16.
//  Copyright © 2016 notungood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var secondsRemaining = 210
    
    var countDownTimer :Timer?
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedStart(_ sender: Any) {
        if (countDownTimer == nil) {
            countDownTimer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                /* From stack overflow: The target can be any object that implements the given method. Sometimes you may want a specific object (other than self, which it usually is) to do the task after the timer fires. */
                selector: #selector(ViewController.oneSecondPassed),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @IBAction func pressedPause(_ sender: Any) {
        countDownTimer?.invalidate()
    }
    
    @IBAction func pressedMinusTenSeconds(_ sender: Any) {
        tenFewerSeconds()
    }
    
    
    @IBAction func pressedAddTenSeconds(_ sender: Any) {
        tenMoreSeconds()
    }
    
    @IBAction func pressedResetTimer(_ sender: Any) {
        countDownTimer?.invalidate()
        resetSeconds()
    }
    
    /////////////////////////////////////
    // Timer Methods
    /////////////////////////////////////
    
    func oneSecondPassed() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
        } else {
            secondsRemaining = 0
        }
        
        secondsLabel.text = String(secondsRemaining)
    }
    
    func tenMoreSeconds() {
        secondsRemaining += 10
        secondsLabel.text = String(secondsRemaining)
    }
    
    func tenFewerSeconds() {
        if secondsRemaining >= 10 {
            secondsRemaining -= 10
        } else {
            secondsRemaining = 0
        }
        secondsLabel.text = String(secondsRemaining)
    }
    
    func resetSeconds () {
        secondsRemaining = 210
        secondsLabel.text = String(secondsRemaining)
    }

    /////////////////////////////////////
    // Memory Warning
    /////////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

