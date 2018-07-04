//
//  Utils.swift
//  RGPD
//
//  Created by Thibault Deprez on 19/06/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import Foundation

class colorGenerator {
    static func oneColor(_ color : String) -> UIColor {
        assert(color[color.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: color)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        return UIColor(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: 1.0)
    }
    
    static func gradient(_ color : [String]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        var array = [CGColor]()
        for item in color {
            array.append(colorGenerator.oneColor(item).cgColor)
        }
        
        gradientLayer.colors = array
        
        return gradientLayer
    }
}
