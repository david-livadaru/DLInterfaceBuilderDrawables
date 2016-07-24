//
//  BackgroundColorApplicable.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol BackgroundColorApplicable : DrawableType {
    var backgroundColorName: String { get set }
    
    func applyBackgroundColor()
}

extension BackgroundColorApplicable where Self : UIView {
    public func applyBackgroundColor() {
        if backgroundColorName.characters.count > 0,
            let color: UIColor = convert(fromString: backgroundColorName) {
            backgroundColor = color
        }
    }
}
