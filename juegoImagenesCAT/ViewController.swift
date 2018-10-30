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
    var indexImage: Int = 0
    var indexSolution: Int = 0
    
    var indexImageSolution: [Int] = [0,0,0,0,0,0,0,0,0]
    var indexImageUser: [Int] = [0,0,0,0,0,0,0,0,0]

    
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    let imageArray: [UIImage] = [#imageLiteral(resourceName: "facebookicon"),#imageLiteral(resourceName: "instagramicon"),#imageLiteral(resourceName: "pinteresticon"),#imageLiteral(resourceName: "twittericon")]
    var buttonArray =  [UIButton] ()
        
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
        
        buttonArray = [buttonOne,buttonTwo,buttonThree,buttonFour,buttonFive,buttonSix,buttonSeven,buttonEight,buttonNine]

    }

    @objc func counter(){
        
        seconds -= 1
        secondsLeft.text = String(seconds)
        
        
        if (seconds == 0) && (startButton.isHidden == false){
            randomImageStart()
            startButton.isHidden = true
            seconds = 5
            
        }
        
        if (seconds == 0) && (startButton.isHidden == true){
            timer.invalidate()
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        randomImageStart()

                     }
    
    func randomImageStart(){
        
        
        buttonOne.setImage(imageArray[indexImage], for: UIControlState.normal)
        
        
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
        indexImageSolution[indexSolution] = randomNumber
        print(indexImageSolution)
        return imageArray[randomNumber]
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        indexImage = indexImage + 1
        if (indexImage>=imageArray.count) {
            indexImage = 0;
        }
        
        
        sender.setImage(imageArray[indexImage], for: UIControlState.normal)
        
        let senderAux = sender.tag - 1
        
        indexImageUser[(senderAux)] = indexImage
        
        //print(indexImageUser)
        
    }
    
}

