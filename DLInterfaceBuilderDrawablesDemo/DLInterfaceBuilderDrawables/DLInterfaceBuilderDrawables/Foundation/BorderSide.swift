//
//  BorderSides.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 20/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public struct BorderSides : OptionSetType {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static public let Top = BorderSides(rawValue: 1 << 0)
    static public let Left = BorderSides(rawValue: 1 << 1)
    static public let Bottom = BorderSides(rawValue: 1 << 2)
    static public let Right = BorderSides(rawValue: 1 << 3)
}

extension BorderSides : StringValueConvertibleType {
    public static func convertFrom(string string: String) -> BorderSides? {
        let nonSpaceString = string.stringByReplacingOccurrencesOfString(" ", withString: "")
        let stringSides = nonSpaceString.componentsSeparatedByString(",")
        var sides: BorderSides? = nil
        for stringSide in stringSides {
            if let side = BorderSides.borderSide(fromString: stringSide) {
                if sides == nil {
                    sides = side
                } else {
                    sides?.unionInPlace(side)
                }
            }
        }
        return sides
    }
    
    private static func borderSide(fromString fromString: String) -> BorderSides? {
        switch fromString.lowercaseString {
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
