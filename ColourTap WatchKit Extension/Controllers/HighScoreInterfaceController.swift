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
    @IBOutlet weak var versionLabel: WKInterfaceLabel!
    
    let manager = GameManager.shared
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let highScore = manager.highScore
        highScoreLabel.setText("\(highScore)")
        
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        versionLabel.setText("v \(version)")
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
