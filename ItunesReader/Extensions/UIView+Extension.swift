//
//  UIView+Extension.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/2/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithFormat(isVC: Bool = false, format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        @available(iOS 11.0, *)
        func filterFormat(_ format: inout String) {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            
            let newInsets = isVC ? window.safeAreaInsets as UIEdgeInsets : self.safeAreaInsets as UIEdgeInsets
            let leftMargin = newInsets.left > 0 ? newInsets.left : 0
            let rightMargin = newInsets.right > 0 ? newInsets.right : 0
            let topMargin = newInsets.top > 0 ? newInsets.top : 0
            let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : 0
            
            //left & top margins
            guard let colonIndex = format.firstIndex(of: ":") else {
                return
            }
            let charAfterColonIndex = format.index(after: colonIndex)
            if format[charAfterColonIndex] == "|" {
                guard let firstBracketIndex = format.firstIndex(of: "[") else {
                    return
                }
                let stuckToWall: Bool = format[format.index(after: charAfterColonIndex)] == "[" ? true : false
                
                if stuckToWall {
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(leftMargin) : Int(topMargin)
                    format.insert(contentsOf: "-\(extraMargin)-", at: format.index(after: charAfterColonIndex))
                } else {
                    let rangeIndexOfMeasurements: ClosedRange<String.Index> = format.index(after: charAfterColonIndex)...format.index(before: firstBracketIndex)
                    var measurements: String = stuckToWall ? "" : String(format[rangeIndexOfMeasurements])
                    measurements = measurements.replacingOccurrences(of: "-", with: "")
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(measurements) ?? 0 + Int(leftMargin) : (Int(measurements) ?? 0) + Int(topMargin)
                    format.replaceSubrange(rangeIndexOfMeasurements, with: "-\(extraMargin)-")
                }
            }
            
            //right & bottom margins
            let lastIndex = format.index(before: format.endIndex)
            if format[lastIndex] == "|" {
                guard let lastBracketIndex = format.lastIndex(of: "]"), let lastIndex = format.lastIndex(of: "|") else {
                    return
                }
                
                let stuckToWall: Bool = lastBracketIndex.encodedOffset == lastIndex.encodedOffset - 1 ? true : false
                
                if stuckToWall {
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(rightMargin) : Int(bottomMargin)
                    format.insert(contentsOf: "-\(extraMargin)-", at: format.index(after: lastBracketIndex))
                } else {
                    let rangeIndexOfMeasurements: ClosedRange<String.Index> = format.index(after: lastBracketIndex)...format.index(before: lastIndex)
                    var measurements: String = String(format[rangeIndexOfMeasurements])
                    measurements = measurements.replacingOccurrences(of: "-", with: "")
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? (Int(measurements) ?? 0) + Int(rightMargin) : (Int(measurements) ?? 0) + Int(bottomMargin)
                    format.replaceSubrange(rangeIndexOfMeasurements, with: "-\(extraMargin)-")
                }
            }
        }
        
        var format: String = format
        if #available(iOS 11.0, *) {
            filterFormat(&format)
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
