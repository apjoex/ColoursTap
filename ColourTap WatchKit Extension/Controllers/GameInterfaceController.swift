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
    @IBOutlet weak var timerWidget: WKInterfaceTimer!
    
    var currentExpiryInterval: TimeInterval = 5.0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        bgGroup.setBackgroundColor(.red)
        timerWidget.setDate(Date().addingTimeInterval(currentExpiryInterval))
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            self.timeUp()
        }
    }
    
    func timeUp() {
        print("TIME UP!")
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
        print(Date())
    }
}
