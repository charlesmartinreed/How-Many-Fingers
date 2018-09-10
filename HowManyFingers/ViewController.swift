//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Charles Martin Reed on 9/10/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var playerScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "5")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessButtonTapped(_ sender: Any) {
        //generate the random number
        let fingerCount = Int(arc4random_uniform(6))
        
        //see if the user typed anything
        guard let fingerGuess = Int(textField.text!) else {
            let alert = UIAlertController(title: "Please enter a guess", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        var fingerImage = String(fingerCount)
        //change the image to reflect the number of fingers the CPU should be holding up
        UIView.animate(withDuration: 0.5) {
            self.imageView.image = UIImage(named: fingerImage)
        }
        
        if fingerGuess == fingerCount {
            
            //congratulate the player on being correct and show their score
            playerScore += 1
            let alert = UIAlertController(title: "Correct. Have 1 point on me!", message: "Your current score is \(playerScore)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yay!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

            
        } else {
            playerScore -= 1
            let alert = UIAlertController(title: "Wrong! Minus 1 point!", message: "Your current score is \(playerScore)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Boo!", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
}

