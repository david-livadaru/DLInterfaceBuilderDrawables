//
//  DrawableType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol DrawableType: NSObjectProtocol {}

extension DrawableType {
    static func opacity(from float: Float) -> Float {
        let minValue: Float = 0.0
        let maxValue: Float = 1.0
        
        return min(maxValue, max(minValue, float))
    }
}
