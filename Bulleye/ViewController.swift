//
//  ViewController.swift
//  Bulleye
//
//  Created by Stefan on 12.07.19.
//  Copyright © 2019 Stefan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance Varibles
    @IBOutlet weak var slider: UISlider!
    var randomValue =  0
    @IBOutlet weak var valueLabel: UILabel!
    var currentValue = 0
    @IBOutlet weak var roundLabel: UILabel!
    var round = 1
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    var titel = ""
    var difference = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels()
        
    }
    
    func updateLabels() {
        
        randomValue = Int.random(in: 1...100)
        currentValue = Int(slider.value)
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
        valueLabel.text = String(randomValue)
    }

    @IBAction func hitMe() {
      
        calculateScore()
        showAlert()
        
    }
    
    func calculateScore() {
        
        difference = abs(randomValue - currentValue)
        
        if difference == 0 {
            titel = "Volltreffer - 100 Punkte"
            score += 100
        } else if difference <= 5 {
            titel = "Sehr gut - 50 Punkte"
            score += 50
        } else if difference <= 15 {
            titel = "OK - 25 Punkte"
            score += 25
        } else {
            titel = "Schade - keine Punkte"
            score += 0
        }
    }
    
    func showAlert() {
       
        let alert = UIAlertController(title: titel, message: "Einstellung: \(currentValue), Abweichung: \(difference)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Weiter", style: .default) {
            
            (action) in
            
            self.newRound()
            self.updateLabels()
            
        }

        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func restart() {
        round = 1
        score = 0
        updateLabels()
    }
    
    
    func newRound() {
        round += 1
        updateLabels()
    }
    
    @IBAction func sliderMoved() {

        currentValue = Int(slider.value)
        print(slider.value)

    }
}

