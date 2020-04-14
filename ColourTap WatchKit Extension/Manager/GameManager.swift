//
//  GameManager.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 20/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import Foundation
import UIKit

class GameManager {
    static let shared = GameManager()
    
    var colours: [Colour] {
        [
            Colour(red: 239.0, green: 58.0, blue: 53.0, name: "Red"),
            Colour(red: 67.0, green: 201.0, blue: 91.0, name: "Green"),
            Colour(red: 47.0, green: 134.0, blue: 235.0, name: "Blue"),
            Colour(red: 255.0, green: 180.0, blue: 0, name: "Yellow"),
            Colour(color: .black, name: "Black"),
            Colour(color: .brown, name: "Brown"),
            Colour(color: .purple, name: "Purple")
        ]
    }
    
    var currentScore = 0
    
    var highScore: Int {
        get {
            return UserDefaults.standard.integer(forKey: "high_score")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "high_score")
        }
    }
}
