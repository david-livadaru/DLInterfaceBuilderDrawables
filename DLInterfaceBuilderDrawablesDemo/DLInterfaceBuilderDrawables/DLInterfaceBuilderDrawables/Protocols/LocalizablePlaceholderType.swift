//
//  LocalizablePlaceholderType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol LocalizablePlaceholderType: DrawableType {
    var localizedPlaceholderKey: String { get set }
    var localizedPlaceholderComment: String { get set }
    
    func updateLocalizedPlaceholder()
}

extension LocalizablePlaceholderType where Self : UIView, Self : PlaceholderType {
    public func updateLocalizedPlaceholder() {
        if localizedPlaceholderKey.characters.count > 0 {
            placeholder = NSLocalizedString(localizedPlaceholderKey, comment: localizedPlaceholderComment)
        }
    }
}
