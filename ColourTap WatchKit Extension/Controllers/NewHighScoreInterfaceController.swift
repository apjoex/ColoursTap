//
//  NewHighScoreInterfaceController.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 17/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import WatchKit
import Foundation

class NewHighScoreInterfaceController: WKInterfaceController {

    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let highScore = UserDefaults.standard.integer(forKey: "high_score")
        highScoreLabel.setText("\(highScore)\n")
    }

    @IBAction func goHome() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Home"], contexts: [], orientation: .vertical, pageIndex: 0)
    }
}
