//
//  DrawableActivityIndicator.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableActivityIndicator : UIActivityIndicatorView, DrawableType {
    @IBInspectable public var colorName: String = "" {
        didSet {
            applyActivityColor()
        }
    }
    
    func applyActivityColor() {
        if let color: UIColor = convert(fromString: colorName) {
            self.color = color
        }
    }
}
