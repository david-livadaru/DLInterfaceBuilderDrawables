//
//  Style.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation
import UIKit

open class Style: NSObject {
    open var attributes: [String : AnyObject] = [:]
    
    static func redTextStyle() -> Style {
        let style = Style()
        style.attributes[NSForegroundColorAttributeName] = UIColor.red
        return style
    }
}

extension Style: StringValueConvertibleClass {}
