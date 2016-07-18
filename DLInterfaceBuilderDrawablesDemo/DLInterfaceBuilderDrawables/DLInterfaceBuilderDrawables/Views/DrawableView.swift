//
//  DrawableView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableView: UIView, UIViewDrawableType {
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            applyBorder()
        }
    }
    @IBInspectable public var borderColorName: String = "" {
        didSet {
            applyBorder()
        }
    }
    
    @IBInspectable public var shadowApplied: Bool = false {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable public var shadowColorName: String = "" {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable public var shadowOffsetPoint: CGSize = CGSize(width: 0.0, height: -3.0) {
        didSet {
            applyShadow()
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = 3.0 {
        didSet {
            applyShadow()
        }
    }
    
    @IBInspectable public var backgroundColorName: String = "" {
        didSet {
            applyBackgroundColor()
        }
    }
    @IBInspectable public var tintColorName: String = "" {
        didSet {
            applyTintColor()
        }
    }
    @IBInspectable public var tintAdjustmentModeName: String = "" {
        didSet {
            applyTintColorAdjustmentMode()
        }
    }
}
