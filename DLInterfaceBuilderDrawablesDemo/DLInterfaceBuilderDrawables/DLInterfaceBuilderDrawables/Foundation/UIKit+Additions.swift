//
//  UIKit+Additions.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

extension UIColor: StringValueConvertibleClass, DrawableType {
    public static func convert(from string: String) -> AnyObject? {
        let components = string.components(separatedBy: ".")
        if let colorName = components.first,
            let invocation = DLInvocation(with: UIColor.self, selectorName: colorName),
            let color = invocation.valueFromInvocation() as? UIColor {
            if components.count > 1,
                let colorAlpha = Float(components[1]) {
                let colorAlphaComponent = CGFloat(opacity(from: colorAlpha / 100.0))
                return color.withAlphaComponent(colorAlphaComponent)
            }
            return color
        } else {
            return nil
        }
    }
}

extension NSAttributedString {
    convenience public init(text: String, styleName: String) {
        let style: Style = convert(from: styleName) ?? Style()
        self.init(text: text, style: style)
    }
    
    convenience public init(text: String, style: Style) {
        self.init(string: text, attributes: style.attributes)
    }
}

extension CGRect {
    func toUIEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: minY, left: minX, bottom: height, right: width)
    }
}
