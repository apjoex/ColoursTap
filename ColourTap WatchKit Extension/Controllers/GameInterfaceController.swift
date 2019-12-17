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

    var currentExpiryInterval: TimeInterval = 2.0
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
        currentColor = Colour.colours.shuffled().first
        bgGroup.setBackgroundColor(currentColor.output)
        let alternativeName = Colour.names.filter{ $0 != currentColor.name }.shuffled().first!
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
        timer.invalidate()
        timerWidget.stop()
        if currentColor.name == displayedName {
            if score > currentHighscore {
                UserDefaults.standard.set(score, forKey: "high_score")
                WKInterfaceController.reloadRootControllers(withNames: ["NewHighScore"], contexts: [])
            } else {
                WKInterfaceController.reloadRootControllers(withNames: ["TimeUp"], contexts: [])

            }
        } else {
            start()
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func groupTapped(_ sender: Any) {
        timer.invalidate()
        timerWidget.stop()
        if currentColor.name == displayedName {
            score += 1
            start()
        } else {
            // Wrong answer
            WKInterfaceDevice().play(.failure)
            if score > currentHighscore {
                UserDefaults.standard.set(score, forKey: "high_score")
                WKInterfaceController.reloadRootControllers(withNames: ["NewHighScore"], contexts: [])
            } else {
                WKInterfaceController.reloadRootControllers(withNames: ["WrongAnswer"], contexts: [])
            }
        }
    }
}
