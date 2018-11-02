//
//  Theme.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    enum Colors {
        case background
        case backgroundBlack
        case darkRoseRed
        case primaryText
        case primaryTextLight
        case hintGray
        
        var color: UIColor {
            switch self {
            case .background: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            case .backgroundBlack: return  UIColor(red: 021/255, green: 021/255, blue: 021/255, alpha: 1.0)
            case .darkRoseRed: return UIColor(red: 201/255, green: 034/255, blue: 040/255, alpha: 1.0)
            case .primaryText: return UIColor(red: 033/255, green: 033/255, blue: 033/255, alpha: 1.0)
            case .primaryTextLight: return UIColor(red: 084/255, green: 085/255, blue: 084/255, alpha: 1.0)
            case .hintGray: return UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
            }
        }
    }
    
    enum Fonts {
        case titleFont
        
        var font: UIFont {
            switch self {
            case .titleFont: return UIFont(name: "AvenirNext-Regular", size: 16)!
            }
        }
    }
}
