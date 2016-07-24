//
//  CornerRadiusApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit
import CoreGraphics
import QuartzCore

public protocol CornerRadiusApplicable : DrawableType {
    var cornerRadius: CGFloat { get set }
    
    func applyCornerRadius()
}

extension CornerRadiusApplicable where Self : UIView {
    public func applyCornerRadius() {
        layer.cornerRadius = cornerRadius
    }
}
