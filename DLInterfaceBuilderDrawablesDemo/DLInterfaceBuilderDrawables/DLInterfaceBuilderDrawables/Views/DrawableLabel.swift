//
//  DrawableLabel.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable open class DrawableLabel: UILabel, BackgroundColorApplicable, CornerRadiusApplicable, BorderApplicable, TextType, AttributedTextType {
    @IBInspectable open var backgroundColorName: String = "" {
        didSet {
            applyBackgroundColor()
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
    
    @IBInspectable open var textStyleName: String = "" {
        didSet {
            updateAttributedText()
        }
    }
    @IBInspectable open var textColorName: String = "" {
        didSet {
            updateAttributedText()
        }
    }
    
    open override var text: String? {
        didSet {
            updateAttributedText()
        }
    }
}
