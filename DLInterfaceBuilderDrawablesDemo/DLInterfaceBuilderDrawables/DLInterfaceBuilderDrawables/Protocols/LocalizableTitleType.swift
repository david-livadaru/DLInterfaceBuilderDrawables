//
//  LocalizableTitleType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol LocalizableTitleType: DrawableType {
    var localizedTitleKey: String { get set }
    var localizedTitleComment: String { get set }
    
    func updateLocalizedTitle()
}

extension LocalizableTitleType where Self : UIView, Self : TitleType {
    public func updateLocalizedTitle() {
        if localizedTitleKey.characters.count > 0 {
            title = NSLocalizedString(localizedTitleKey, comment: localizedTitleComment)
        }
    }
}
