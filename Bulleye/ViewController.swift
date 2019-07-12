//
//  ViewController.swift
//  Bulleye
//
//  Created by Stefan on 12.07.19.
//  Copyright © 2019 Stefan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    var randomValue =  0
    @IBOutlet weak var valueLabel: UILabel!
    var currentValue = 0
    @IBOutlet weak var roundLabel: UILabel!
    var round = 1
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels()
        
    }
    
    func updateLabels() {
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
        valueLabel.text = String(currentValue)
    }

    @IBAction func hitMe() {
        print("Hit Me")
        newRound()
    }
    
    @IBAction func restart() {
        print("restart")
    }
    
    @IBAction func info() {
        print("info")
        
    }
    
    func startGame() {
    
    }
    
    func newRound() {
        valueLabel.text = String(slider.value)
    }
    
    @IBAction func sliderMoved() {
        print(slider.value)
        currentValue = Int(slider.value)
        valueLabel.text = String(currentValue)
        
    }
}

