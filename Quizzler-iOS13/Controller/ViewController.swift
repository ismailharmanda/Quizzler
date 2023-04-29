//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer=Timer()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain=QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer=sender.currentTitle! //True, False
        let isAnswerCorrect=quizBrain.checkAnswer(userAnswer)
        trueButton.isEnabled=false
        falseButton.isEnabled=false
        quizBrain.updateQuestion()
        timer=Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        if(isAnswerCorrect){
            sender.backgroundColor=UIColor.green
        } else {sender.backgroundColor=UIColor.red}
        
    }
    
    @objc func updateUI(){
        progressBar.progress=quizBrain.getProgress()
        questionLabel.text=quizBrain.getCurrentQuestionText()
        scoreLabel.text="Score: \(quizBrain.score)"
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
        trueButton.isEnabled=true
        falseButton.isEnabled=true
    }
}

