//
//  KNUIColor.swift
//  kynguyenCodebase
//
//  Created by Ky Nguyen on 11/25/16.
//  Copyright © 2016 kynguyen. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// - Parameters:
    ///     - amount: greater than 1 -> darker
    func adjustBrightness(_ amount: CGFloat) -> UIColor {
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var brightness:CGFloat = 0
        var alpha:CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            brightness += (amount-1.0)
            brightness = max(min(brightness, 1.0), 0.0)
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }
        return self
    }
    
    func alpha(_ value: CGFloat) -> UIColor {
        return withAlphaComponent(value)
    }
   
    func getRGBAComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var (red, green, blue, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
        if getRed(&red, green: &green, blue: &blue, alpha: &alpha) { return (red, green, blue, alpha)
        } else {
            return nil
        }
    }
}

