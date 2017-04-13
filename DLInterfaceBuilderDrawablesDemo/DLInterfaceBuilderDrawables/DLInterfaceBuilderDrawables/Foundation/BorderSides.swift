//
//  BorderSides.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 20/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public struct BorderSides: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static public let Top = BorderSides(rawValue: 1 << 0)
    static public let Left = BorderSides(rawValue: 1 << 1)
    static public let Bottom = BorderSides(rawValue: 1 << 2)
    static public let Right = BorderSides(rawValue: 1 << 3)
}

extension BorderSides: StringValueConvertibleType {
    public static func convert(from string: String) -> BorderSides? {
        let nonSpaceString = string.replacingOccurrences(of: " ", with: "")
        let stringSides = nonSpaceString.components(separatedBy: ",")
        var sides: BorderSides? = nil
        for stringSide in stringSides {
            if let side = BorderSides.borderSide(from: stringSide) {
                if sides == nil {
                    sides = side
                } else {
                    sides?.formUnion(side)
                }
            }
        }
        return sides
    }
    
    private static func borderSide(from string: String) -> BorderSides? {
        switch string.lowercased() {
        case "top":
            return .Top
        case "left":
            return .Left
        case "bottom":
            return .Bottom
        case "right":
            return .Right
        default:
            return nil
        }
    }
}
