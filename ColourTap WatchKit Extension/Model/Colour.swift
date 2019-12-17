//
//  Colour.swift
//  ColourTap WatchKit Extension
//
//  Created by JOSEPH AKINDE-PETERS on 17/12/2019.
//  Copyright © 2019 JOSEPH AKINDE-PETERS. All rights reserved.
//

import Foundation
import UIKit

struct Colour {
    var red: Int
    var green: Int
    var blue: Int
    var name: String
    
    var output: UIColor {
        UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1.0)
    }
    
    static var names: [String] {
        ["Red","Green","Blue"]
    }
    
    static var colours: [Colour] {
        [
            Colour(red: 255, green: 0, blue: 0, name: "Red"),
            Colour(red: 0, green: 255, blue: 0, name: "Green"),
            Colour(red: 0, green: 0, blue: 255, name: "Blue")
        ]
    }
}
