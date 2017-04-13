//
//  DrawableProgressView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableProgressView: UIProgressView {
    @IBInspectable open var progressTintColorName: String = "" {
        didSet {
            applyProgressTintColor()
        }
    }
    
    @IBInspectable open var trackTintColorName: String = "" {
        didSet {
            applyTrackTintColor()
        }
    }
    
    fileprivate func applyProgressTintColor() {
        if let color: UIColor = DLInterfaceBuilderDrawables.convert(from: progressTintColorName) {
            progressTintColor = color
        }
    }
    
    fileprivate func applyTrackTintColor() {
        if let color: UIColor = DLInterfaceBuilderDrawables.convert(from: trackTintColorName) {
            trackTintColor = color
        }
    }
}
