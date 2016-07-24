//
//  AttributedTextType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

public protocol AttributedTextType : TextType {
    var textStyleName: String { get set }
    var textColorName: String { get set }
    var attributedText: NSAttributedString? { get set }
    
    func updateAttributedText()
}

extension AttributedTextType where Self : UIView {
    public func updateAttributedText() {
        var attributes: [String : AnyObject] = [:]
        if textStyleName.characters.count > 0,
            let style: Style = convert(fromString: textStyleName) {
            attributes.append(fromDictionary: style.attributes)
        }
        if let color: UIColor = convert(fromString: textColorName) {
            attributes[NSForegroundColorAttributeName] = color
        }
        attributedText = NSAttributedString(string: text ?? "", attributes: attributes)
    }
}
