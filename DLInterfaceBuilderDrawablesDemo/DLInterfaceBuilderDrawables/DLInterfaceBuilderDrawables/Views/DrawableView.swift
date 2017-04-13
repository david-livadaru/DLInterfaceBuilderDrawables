//
//  DrawableView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableView: UIView, BackgroundColorApplicable, TintApplicable,
    CornerRadiusApplicable, BorderApplicable, ShadowApplicable {
    @IBInspectable open var backgroundColorName: String = "" {
        didSet {
            applyBackgroundColor()
        }
    }
    @IBInspectable open var tintColorName: String = "" {
        didSet {
            applyTintColor()
        }
    }
    @IBInspectable open var tintAdjustmentModeName: String = "" {
        didSet {
            applyTintColorAdjustmentMode()
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0.0 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0.0 {
        didSet {
            applyBorder()
        }
    }
    @IBInspectable open var borderColorName: String = "" {
        didSet {
            applyBorder()
        }
    }
    
    @IBInspectable open var shadowApplied: Bool = false {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable open var shadowColorName: String = "" {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable open var shadowOpacity: Float = 0.0 {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable open var shadowOffsetPoint: CGPoint = CGPoint(x: 0.0, y: -3.0) {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable open var shadowRadius: CGFloat = 3.0 {
        didSet {
            applyShadow()
        }
    }
}
