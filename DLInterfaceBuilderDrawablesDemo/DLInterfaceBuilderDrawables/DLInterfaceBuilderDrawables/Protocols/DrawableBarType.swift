//
//  DrawableBarType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol DrawableBarType: DrawableType {
    var barTintColorName: String { get set }
    var barTintColor: UIColor? { get set }
    
    func applyBarTintColor()
}

extension DrawableBarType where Self : UIView {
    public func applyBarTintColor() {
        if let barColor: UIColor = DLInterfaceBuilderDrawables.convert(from: barTintColorName) {
            barTintColor = barColor
        }
    }
}
