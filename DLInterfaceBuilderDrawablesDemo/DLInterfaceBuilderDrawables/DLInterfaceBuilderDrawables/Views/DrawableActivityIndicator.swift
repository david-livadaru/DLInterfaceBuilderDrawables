//
//  DrawableActivityIndicator.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableActivityIndicator: UIActivityIndicatorView, DrawableType {
    @IBInspectable open var colorName: String = "" {
        didSet {
            applyActivityColor()
        }
    }
    
    func applyActivityColor() {
        if let color: UIColor = DLInterfaceBuilderDrawables.convert(from: colorName) {
            self.color = color
        }
    }
}
