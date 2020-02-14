//
//  WrongAnswerInterfaceController.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 17/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import WatchKit
import Foundation

class WrongAnswerInterfaceController: WKInterfaceController {

    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        scoreLabel.setText("Your score: \(GameManager.currentScore)\n")
    }

    @IBAction func retry() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Game"], contexts: [], orientation: .vertical, pageIndex: 0)
    }
    
    @IBAction func goHome() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Home"], contexts: [], orientation: .vertical, pageIndex: 0)
    }
}
