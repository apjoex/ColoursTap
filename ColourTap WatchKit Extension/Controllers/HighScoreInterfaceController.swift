//
//  HighScoreInterfaceController.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 17/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import WatchKit
import Foundation


class HighScoreInterfaceController: WKInterfaceController {

    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let highScore = UserDefaults.standard.integer(forKey: "high_score")
        highScoreLabel.setText("\(highScore)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
