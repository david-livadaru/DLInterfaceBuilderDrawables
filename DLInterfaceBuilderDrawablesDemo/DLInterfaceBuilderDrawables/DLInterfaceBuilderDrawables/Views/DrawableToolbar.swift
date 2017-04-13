//
//  DrawableToolbar.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableToolbar: UIToolbar, BackgroundColorApplicable, TintApplicable,
    DrawableBarType {
    @IBInspectable open var barTintColorName: String = "" {
        didSet {
            applyBarTintColor()
        }
    }
    
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
}
