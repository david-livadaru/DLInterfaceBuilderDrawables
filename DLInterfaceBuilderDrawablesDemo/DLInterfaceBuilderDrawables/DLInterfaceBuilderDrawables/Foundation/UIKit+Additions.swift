//
//  UIKit+Additions.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

extension UIColor : StringValueConvertibleClass, DrawableType {
    public static func convertFrom(string string: String) -> AnyObject? {
        let components = string.componentsSeparatedByString(".")
        if let colorName = components.first,
            let color = DLSelectorPerformer.performSelector(colorName, forClass: String(UIColor)) as? UIColor {
            if components.count > 1, let colorAlphaFloat: Float? = Float(components[2]) {
                let colorAlpha = colorAlphaFloat ?? 100.0
                let colorAlphaComponent = CGFloat(opacity(from: colorAlpha / 100.0))
                return color.colorWithAlphaComponent(colorAlphaComponent)
            }
            return color
        } else {
            return nil
        }
    }
}

extension NSAttributedString {
    convenience public init(text: String, styleName: String) {
        let style: Style = convertFrom(string: styleName) ?? Style()
        self.init(text: text, style: style)
    }
    
    convenience public init(text: String, style: Style) {
        self.init(string: text, attributes: style.attributes)
    }
}
