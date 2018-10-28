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
    var indexImage = -1
    
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    let imageArray = ["facebookicon", "instagramicon", "twittericon", "pinteresticon"]
        
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @objc func counter(){
        
        seconds -= 1
        secondsLeft.text = String(seconds)
        
        
        if (seconds == 0){
            randomImageStart()
            seconds = 5
            secondsLeft.text = String(seconds)

        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        startButton.isHidden = true
        randomImageStart()

                     }
    
    func randomImageStart(){
        buttonOne.setImage(randomImage(), for: .normal)
        buttonTwo.setImage(randomImage(), for: .normal)
        buttonThree.setImage(randomImage(), for: .normal)
        buttonFour.setImage(randomImage(), for: .normal)
        buttonFive.setImage(randomImage(), for: .normal)
        buttonSix.setImage(randomImage(), for: .normal)
        buttonSeven.setImage(randomImage(), for: .normal)
        buttonEight.setImage(randomImage(), for: .normal)
        buttonNine.setImage(randomImage(), for: .normal)
    }
    
    func randomImage() -> UIImage{
        let unsignedArrayCount = UInt32(imageArray.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: imageArray[randomNumber])!
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if ((indexImage+1) > imageArray.count) {
            indexImage = 0;
        }
        
        //self.buttonOne.image(for: .normal) = [imageArray objectAtIndex:indexImage]
        
        //sender.setImage(randomImage(), for: .normal)
        
    
        
    }
    
}

