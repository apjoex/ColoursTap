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
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var name: String
    
    var output: UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static var colours: [Colour] {
        [
            Colour(red: 239.0, green: 58.0, blue: 53.0, name: "Red"),
            Colour(red: 67.0, green: 201.0, blue: 91.0, name: "Green"),
            Colour(red: 47.0, green: 134.0, blue: 235.0, name: "Blue"),
            Colour(red: 255.0, green: 180.0, blue: 0, name: "Yellow"),
            Colour(red: 0.0, green: 0.0, blue: 0.0, name: "Black"),
            Colour(red: 255.0, green: 192.0, blue: 203.0, name: "Pink"),
            Colour(red: 128.0, green: 0.0, blue: 128.0, name: "Purple")
        ]
    }
}
