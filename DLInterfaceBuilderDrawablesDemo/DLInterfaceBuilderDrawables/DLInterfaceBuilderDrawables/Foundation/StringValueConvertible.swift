//
//  StringValueConvertible.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol StringValueConvertibleType {
    static func convertFrom(string string: String) -> Self?
}

public protocol StringValueConvertibleClass: class {
    static func convertFrom(string string: String) -> AnyObject?
}

extension StringValueConvertibleClass where Self : NSObject {
    public static func convertFrom(string string: String) -> AnyObject? {
        if let value = DLSelectorPerformer.performSelector(string, forClass: String(Self)) {
            return value
        } else {
            return nil
        }
    }
}

public func convertFrom<T : StringValueConvertibleClass>(string string: String) -> T? {
    if string.characters.count > 0, let instance = T.convertFrom(string: string) as? T {
        return instance
    } else {
        return nil
    }
}
