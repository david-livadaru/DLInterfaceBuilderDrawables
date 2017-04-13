//
//  TintApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol TintApplicable: DrawableType {
    var tintColorName: String { get set }
    var tintAdjustmentModeName: String { get set }
    
    func applyTintColor()
    func applyTintColorAdjustmentMode()
}

extension TintApplicable where Self : UIView {
    public func applyTintColor() {
        if tintColorName.characters.count > 0,
            let color: UIColor = DLInterfaceBuilderDrawables.convert(from: tintColorName) {
            tintColor = color
        }
    }
    
    public func applyTintColorAdjustmentMode() {
        if tintAdjustmentModeName.characters.count > 0,
            let adjustmentMode = UIViewTintAdjustmentMode.convert(from: tintAdjustmentModeName) {
            tintAdjustmentMode = adjustmentMode
        }
    }
}

extension UIViewTintAdjustmentMode: StringValueConvertibleType {
    public static func convert(from string: String) -> UIViewTintAdjustmentMode? {
        guard string.characters.count > 0 else { return nil }
        switch string.lowercased() {
        case "normal":
            return .normal
        case "dimmed":
            return .dimmed
        default:
            return .automatic
        }
    }
}
