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
    let color: UIColor
    let name: String
    
    init(color: UIColor, name: String) {
        self.color = color
        self.name = name
    }
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, name: String) {
        let color =  UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        self.init(color: color, name: name)
    }
}
