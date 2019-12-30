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
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let name: String
    
    var output: UIColor {
        UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}
