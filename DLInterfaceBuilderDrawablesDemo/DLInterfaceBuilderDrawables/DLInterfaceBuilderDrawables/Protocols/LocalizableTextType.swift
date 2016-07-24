//
//  LocalizableTextType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol LocalizableTextType : DrawableType {
    var localizedTextKey: String { get set }
    var localizedTextComment: String { get set }
    
    func updateLocalizedText()
}

extension LocalizableTextType where Self : UIView, Self : TextType {
    public func updateLocalizedText() {
        if localizedTextKey.characters.count > 0 {
            text = NSLocalizedString(localizedTextKey, comment: localizedTextComment)
        }
    }
}
