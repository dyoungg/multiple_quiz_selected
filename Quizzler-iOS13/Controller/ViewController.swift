//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var lastButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    

    var quizBrain = QuizBrain() 
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let result = quizBrain.checkAnswer(userAnswer!)
        
        if result {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        quizBrain.nextQuestion() 
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        lastButton.setTitle(quizBrain.getFirstSection(), for: UIControl.State.normal)
        trueButton.setTitle(quizBrain.getSecondSection(), for: UIControl.State.normal)
        falseButton.setTitle(quizBrain.getThirdSection(), for: UIControl.State.normal)


        lastButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score \(quizBrain.getScore())"
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
     
}

