//
//  GameInterfaceController.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 17/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import WatchKit
import Foundation


class GameInterfaceController: WKInterfaceController {

    @IBOutlet weak var bgGroup: WKInterfaceGroup!
    @IBOutlet weak var colorNameLabel: WKInterfaceLabel!
    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    @IBOutlet weak var timerWidget: WKInterfaceTimer!

    var currentExpiryInterval: TimeInterval {
        get {
            switch score {
            case 0..<50:
                return 2.0
            case 50..<100:
                return 1.5
            default:
                return 1.0
            }
        }
    }
    var currentColor: Colour!
    var displayedName: String = ""
    var score: Int = 0
    var currentHighscore: Int = 0
    
    var timer: Timer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        currentHighscore = UserDefaults.standard.integer(forKey: "high_score")
        start()
    }
    
    func start() {
        scoreLabel.setText("Score: \(score)")
        currentColor = GameManager.colours.shuffled().first
        bgGroup.setBackgroundColor(currentColor.output)
        let alternativeName = GameManager.colours.map{ $0.name }.filter{ $0 != currentColor.name }.shuffled().first!
        displayedName = Bool.random() ? currentColor.name : alternativeName
        colorNameLabel.setText(displayedName)
        startTimer()
    }
    
    func startTimer() {
        timerWidget.setDate(Date().addingTimeInterval(currentExpiryInterval))
        timer = Timer.scheduledTimer(withTimeInterval: currentExpiryInterval, repeats: false) { _ in
            self.timeUp()
        }
        timerWidget.start()
    }
    
    func timeUp() {
        resetTimer()
        if score > currentHighscore {
            UserDefaults.standard.set(score, forKey: "high_score")
            WKInterfaceDevice().play(.success)
            WKInterfaceController.reloadRootPageControllers(withNames: ["NewHighScore"], contexts: [], orientation: .vertical, pageIndex: 0)
        } else {
            WKInterfaceDevice().play(.failure)
            GameManager.currentScore = score
            WKInterfaceController.reloadRootPageControllers(withNames: ["TimeUp"], contexts: [], orientation: .vertical, pageIndex: 0)
        }
    }
    
    func resetTimer() {
        timer.invalidate()
        timerWidget.stop()
    }

    @IBAction func groupTapped(_ sender: Any) {
        resetTimer()
        if currentColor.name == displayedName {
            score += 1
            start()
        } else {
            WKInterfaceDevice().play(.failure)
            GameManager.currentScore = score
            if score > currentHighscore {
                UserDefaults.standard.set(score, forKey: "high_score")
                WKInterfaceController.reloadRootPageControllers(withNames: ["NewHighScore"], contexts: [], orientation: .vertical, pageIndex: 0)
            } else {
                WKInterfaceController.reloadRootPageControllers(withNames: ["WrongAnswer"], contexts: [], orientation: .vertical, pageIndex: 0)
            }
        }
    }
    
    @IBAction func groupSwiped(_ sender: Any) {
        resetTimer()
        if currentColor.name != displayedName {
            score += 1
            start()
        } else {
            WKInterfaceDevice().play(.failure)
            GameManager.currentScore = score
            if score > currentHighscore {
                UserDefaults.standard.set(score, forKey: "high_score")
                WKInterfaceController.reloadRootPageControllers(withNames: ["NewHighScore"], contexts: [], orientation: .vertical, pageIndex: 0)
            } else {
                WKInterfaceController.reloadRootPageControllers(withNames: ["WrongAnswer"], contexts: [], orientation: .vertical, pageIndex: 0)
            }
        }
    }
}
