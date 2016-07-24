//
//  DrawableLabel.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

@IBDesignable public class DrawableLabel: UILabel, BackgroundColorApplicable, CornerRadiusApplicable, BorderApplicable, TextType, AttributedTextType {
    @IBInspectable public var backgroundColorName: String = "" {
        didSet {
            applyBackgroundColor()
        }
    }
    
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
    
    @IBInspectable public var textStyleName: String = "" {
        didSet {
            updateAttributedText()
        }
    }
    @IBInspectable public var textColorName: String = "" {
        didSet {
            updateAttributedText()
        }
    }
    
    public override var text: String? {
        didSet {
            updateAttributedText()
        }
    }
}
