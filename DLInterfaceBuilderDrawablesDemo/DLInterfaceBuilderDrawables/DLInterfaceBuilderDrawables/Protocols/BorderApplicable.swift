//
//  BorderApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol BorderApplicable: DrawableType {
    var borderWidth: CGFloat { get set }
    var borderColorName: String { get set }
    
    func applyBorder()
}

extension BorderApplicable where Self : UIView {
    public func applyBorder() {
        layer.borderWidth = borderWidth
        if let borderColor: UIColor = DLInterfaceBuilderDrawables.convert(from: borderColorName) {
            layer.borderColor = borderColor.cgColor
        }
    }
}
