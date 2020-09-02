//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Vadde Narendra on 9/1/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Method:-1 data insert into the countries array
//        countries.append("australia")
//        countries.append("canada")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("japan")
//        countries.append("netherlands")
//        countries.append("newZealand")
//        countries.append("norway")
//        countries.append("sweden")
//        countries.append("switzerland")
//        countries.append("unitedKingdom")
//        countries.append("unitedStates")
        
        //Method:-2 data insert into the countries array
        countries += ["australia", "canada", "france", "germany", "japan", "netherlands", "newZealand", "norway", "sweden", "switzerland", "unitedKingdom", "unitedStates"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestions()
    }

    func askQuestions(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title = "String"
        var title1 = "String"
        if sender.tag == correctAnswer {
            title = "Correct Answer"
            score += 1
        } else {
            title = "Wrong Answer"
            score -= 1
        }
        
        if score == 10 {
            title1 = "You WON and Start New Game"
        } else {
            title1 = "Continue to play"
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertController.addAction(.init(title: title1, style: .default, handler: askQuestions))
        present(alertController, animated: true, completion: nil)
        
        if title1 == "You WON and Start New Game" {
            score = 0
        }
    }
}

