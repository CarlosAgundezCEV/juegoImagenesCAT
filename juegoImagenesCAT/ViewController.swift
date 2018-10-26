//
//  ViewController.swift
//  juegoImagenesCAT
//
//  Created by wizO on 24/10/2018.
//  Copyright © 2018 Carlos Agundez Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer = Timer()
    var seconds = 5
    
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @objc func counter(){
        
        seconds -= 1
        secondsLeft.text = String(seconds)
        
        
        if (seconds == 0){
            
            timer.invalidate()
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        startButton.isHidden = true
                     }
    
    
    
}

