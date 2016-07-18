//
//  UIViewDrawableType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol UIViewDrawableType : CALayerDrawableType {
    var backgroundColorName: String { get set }
    var tintColorName: String { get set }
    var tintAdjustmentModeName: String { get set }
    
    func applyBackgroundColor()
    func applyTintColor()
    func applyTintColorAdjustmentMode()
}

extension UIViewDrawableType where Self : UIView {
    public func applyBackgroundColor() {
        if backgroundColorName.characters.count > 0,
            let color: UIColor = convertFrom(string: backgroundColorName) {
            backgroundColor = color
        }
    }
    
    public func applyTintColor() {
        if tintColorName.characters.count > 0, let color: UIColor = convertFrom(string: tintColorName) {
            tintColor = color
        }
    }
    
    public func applyTintColorAdjustmentMode() {
        if tintAdjustmentModeName.characters.count > 0,
            let adjustmentMode = UIViewTintAdjustmentMode.convertFrom(string: tintAdjustmentModeName) {
            tintAdjustmentMode = adjustmentMode
        }
    }
}

extension UIViewTintAdjustmentMode : StringValueConvertibleType {
    public static func convertFrom(string string: String) -> UIViewTintAdjustmentMode? {
        guard string.characters.count > 0 else { return nil }
        switch string.lowercaseString {
        case "normal":
            return .Normal
        case "dimmed":
            return .Dimmed
        default:
            return .Automatic
        }
    }
}