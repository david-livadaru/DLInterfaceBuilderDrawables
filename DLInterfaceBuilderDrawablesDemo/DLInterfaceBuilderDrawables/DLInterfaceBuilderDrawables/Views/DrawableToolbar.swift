//
//  DrawableToolbar.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableToolbar : UIToolbar, BackgroundColorApplicable, TintApplicable,
    DrawableBarType {
    @IBInspectable public var barTintColorName: String = "" {
        didSet {
            applyBarTintColor()
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
