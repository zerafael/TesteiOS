//
//  UIColor+Extension.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 10/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    convenience init(rgb: String) {
        var color: String = rgb
        
        if (color.hasPrefix("#")) {
            color.remove(at: color.startIndex)
        }
        
        let colorHex: Int = Int(color, radix: 16)!
        
        let red = CGFloat((colorHex >> 16) & 0xFF)
        let green = CGFloat((colorHex >> 8) & 0xFF)
        let blue = CGFloat(colorHex & 0xFF)
        
        self.init(r: red, g: green, b: blue)
    }
    
    convenience init(white: CGFloat) {
        self.init(white: white/255, alpha: 1)
    }
}
