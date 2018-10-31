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
    var seconds = 10
    var indexImage: Int = 0
    var indexSolution: Int = 0
    
    var indexImageSolution: [Int] = [0,0,0,0,0,0,0,0,0]
    var indexImageUser: [Int] = [0,0,0,0,0,0,0,0,0]

    
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLeftLbl: UILabel!
    
    @IBOutlet weak var youWinLbl: UILabel!
    
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
        
        youWinLbl.text = ""

    }

    @objc func counter(){
        
        seconds -= 1
        secondsLeft.text = String(seconds)
        
        
        if (seconds == 0) && (startButton.isHidden == false){
            putInitialImage()
            startButton.isHidden = true
            seconds = 20
            
        }
        
        if (seconds == 0) && (startButton.isHidden == true){
            timer.invalidate()
            timeLeftLbl.text = ""
            secondsLeft.text = ""
            compareSolution()
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        randomImage()

                     }
    
    
    func randomImage(){
        var randomIndex:Int
        
        for i in 0...8{
            randomIndex = Int(arc4random_uniform(UInt32(imageArray.count)))
            indexImageSolution[i] = randomIndex
            buttonArray[i].setImage(imageArray[randomIndex], for: UIControlState.normal)
            
        }
        
        print(indexImageSolution)

    }
    
    func putInitialImage(){
        for i in 0...8{
            buttonArray[i].setImage(#imageLiteral(resourceName: "apple"), for: UIControlState.normal)
        }
    }
    
    func compareSolution(){
        
        if (indexImageUser == indexImageSolution){
            youWinLbl.text = "You win"
        }else{
            
            youWinLbl.text = "You lose"
        }
    
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        indexImage = indexImage + 1
        if (indexImage>=imageArray.count) {
            indexImage = 0;
        }
        
        
        sender.setImage(imageArray[indexImage], for: UIControlState.normal)
        
        let senderAux = sender.tag - 1
        
        indexImageUser[(senderAux)] = indexImage
        
        
    }
    
}

