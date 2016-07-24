//
//  AttributedPlacedholderType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol AttributedPlacedholderType : PlaceholderType {
    var placeholderStyleName: String { get set }
    var placeholderColorName: String { get set }
    var attributedPlaceholder: NSAttributedString? { get set }
    
    func updateAttributedPlaceholder()
}

extension AttributedPlacedholderType where Self : UIView {
    public func updateAttributedPlaceholder() {
        var attributes: [String : AnyObject] = [:]
        if placeholderStyleName.characters.count > 0,
            let style: Style = convert(fromString: placeholderStyleName) {
            attributes.append(fromDictionary: style.attributes)
        }
        if let color: UIColor = convert(fromString: placeholderColorName) {
            attributes[NSForegroundColorAttributeName] = color
        }
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
    }
}
