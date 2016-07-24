//
//  DrawableProgressView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableProgressView: UIProgressView {
    @IBInspectable public var progressTintColorName: String = "" {
        didSet {
            applyProgressTintColor()
        }
    }
    
    @IBInspectable public var trackTintColorName: String = "" {
        didSet {
            applyTrackTintColor()
        }
    }
    
    private func applyProgressTintColor() {
        if let color: UIColor = convert(fromString: progressTintColorName) {
            progressTintColor = color
        }
    }
    
    private func applyTrackTintColor() {
        if let color: UIColor = convert(fromString: trackTintColorName) {
            trackTintColor = color
        }
    }
}
