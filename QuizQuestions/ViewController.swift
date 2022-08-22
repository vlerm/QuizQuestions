//
//  ViewController.swift
//  Alert
//
//  Created by Вадим Лавор on 26.02.22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var questions = [String]()
    
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var gradientImageView: UIImageView!
    
    override func viewDidLoad() {
        gradientImageView.alpha = 0.0
        super.viewDidLoad()
        readFromFile()
        randomizeQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupGradientAnimation()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
         UIView.animate(withDuration: 0.8) {
             self.randomizeQuestions()
         }
     }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8) {
            self.randomizeQuestions()
        }
    }

    func randomizeQuestions() {
        let randomIndex = Int.random(in: 0...questions.count - 2)
        questionsLabel.text = questions[randomIndex]
    }
    
    func setupGradientAnimation(){
        UIView.animate(withDuration: 1, delay: 0.02, options: [.repeat, .autoreverse], animations: {
            self.gradientImageView.alpha = 1
        })
    }
    
    func readFromFile() {
        if let bundlePath = Bundle.main.path(forResource: "questions", ofType: "txt"){
            if let textWords = try? String(contentsOfFile: bundlePath){
                questions = textWords.components(separatedBy: "\n")
            }
        }
    }
    
}
