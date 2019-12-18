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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    @IBAction func retry() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Game"], contexts: [], orientation: .vertical, pageIndex: 0)
    }
    
    @IBAction func goHome() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Home"], contexts: [], orientation: .vertical, pageIndex: 0)
    }
}
