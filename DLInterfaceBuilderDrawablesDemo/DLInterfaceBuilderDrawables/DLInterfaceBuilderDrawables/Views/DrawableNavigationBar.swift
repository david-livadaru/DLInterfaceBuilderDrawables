//
//  DrawableNavigationBar.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableNavigationBar: UINavigationBar, BackgroundColorApplicable, TintApplicable,
    DrawableBarType {
    @IBInspectable open var barTintColorName: String = "" {
        didSet {
            applyBarTintColor()
        }
    }
    
    @IBInspectable open var titleTextStyleName: String = "" {
        didSet {
            applyTitleTextStyle()
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
    
    fileprivate func applyTitleTextStyle() {
        if let titleTextStyle: Style = DLInterfaceBuilderDrawables.convert(from: titleTextStyleName) {
            titleTextAttributes = titleTextStyle.attributes
        }
    }
}
