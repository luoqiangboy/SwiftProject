//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by luoqiang on 16/4/26.
//  Copyright © 2016年 CodeTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    var counter = 0.0
    var timer = NSTimer()
    var isPlay = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
        
    }

    @IBAction func start(sender: UIButton) {
        if isPlay {
            return
        }
        startBtn.enabled = false
        stopBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(ViewController.updatetime), userInfo: nil, repeats: true)
        isPlay = true
    }
    
    @IBAction func stop(sender: UIButton) {
        startBtn.enabled = true
        stopBtn.enabled = false
        timer.invalidate()
        isPlay = false
    }

    @IBAction func reset(sender: UIButton) {
        timer.invalidate()
        isPlay = false
        counter = 0.0
        timeLabel.text = String(counter)
        startBtn.enabled = true
        stopBtn.enabled = true
    }
    
    func updatetime()  {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
}

