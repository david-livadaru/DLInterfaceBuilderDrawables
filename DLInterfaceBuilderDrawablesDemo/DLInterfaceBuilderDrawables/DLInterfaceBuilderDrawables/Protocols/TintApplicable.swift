//
//  TintApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol TintApplicable : DrawableType {
    var tintColorName: String { get set }
    var tintAdjustmentModeName: String { get set }
    
    func applyTintColor()
    func applyTintColorAdjustmentMode()
}

extension TintApplicable where Self : UIView {
    public func applyTintColor() {
        if tintColorName.characters.count > 0, let color: UIColor = convert(fromString: tintColorName) {
            tintColor = color
        }
    }
    
    public func applyTintColorAdjustmentMode() {
        if tintAdjustmentModeName.characters.count > 0,
            let adjustmentMode = UIViewTintAdjustmentMode.convert(fromString: tintAdjustmentModeName) {
            tintAdjustmentMode = adjustmentMode
        }
    }
}

extension UIViewTintAdjustmentMode : StringValueConvertibleType {
    public static func convert(fromString string: String) -> UIViewTintAdjustmentMode? {
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
