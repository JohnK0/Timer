//
//  ViewController.swift
//  Timer
//
//  Created by John Kim on 11/17/20.
//

import UIKit

class ViewController: UIViewController {

    var seconds = 0
    var timer = Timer()
    var timeIsRunning = false
     
    
    @IBOutlet weak var digitalClockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startStopTime(_ sender: UIButton) {
        sender.setTitle("Stop", for: .normal)
        sender.setTitleColor(.red, for: .normal)
        if !timeIsRunning {
            timer =  Timer.scheduledTimer(
                   timeInterval: TimeInterval(1),
                   target      : self,
                   selector    : #selector(ViewController.updateTime),
                   userInfo    : nil,
                   repeats     : true)
            timeIsRunning = true
        }
        else {
            timer.invalidate()
            timeIsRunning = false
            sender.setTitle("Start", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
        }
    }
    
    @objc func updateTime(time: TimeInterval) {
        seconds += 1
        digitalClockLabel.text = digitalClockFormat(time: TimeInterval(seconds))
    }
    
    func digitalClockFormat (time:TimeInterval) -> String {
        let hour = Int(time)/3600
        let minute = Int(time)/60%60
        let second = Int(time)%60
        
        return String(format:"%02i:%02i:%02i", hour, minute, second)
    }
    
    @IBAction func ResetTime(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0
        digitalClockLabel.text = digitalClockFormat(time: TimeInterval(seconds))
    }
    
    
    
}

