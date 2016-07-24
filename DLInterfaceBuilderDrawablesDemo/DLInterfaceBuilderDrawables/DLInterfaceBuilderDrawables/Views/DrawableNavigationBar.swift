//
//  DrawableNavigationBar.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableNavigationBar : UINavigationBar, BackgroundColorApplicable, TintApplicable,
    DrawableBarType {
    @IBInspectable public var barTintColorName: String = "" {
        didSet {
            applyBarTintColor()
        }
    }
    
    @IBInspectable public var titleTextStyleName: String = "" {
        didSet {
            applyTitleTextStyle()
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
    
    private func applyTitleTextStyle() {
        if let titleTextStyle: Style = convert(fromString: titleTextStyleName) {
            titleTextAttributes = titleTextStyle.attributes
        }
    }
}
