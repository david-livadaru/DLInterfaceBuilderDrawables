//
//  StringValueConvertible.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol StringValueConvertibleType {
    static func convert(fromString string: String) -> Self?
}

public protocol StringValueConvertibleClass: class {
    static func moduleName() -> String
    static func convert(fromString string: String) -> AnyObject?
}

extension StringValueConvertibleClass where Self : NSObject {
    static public func moduleName() -> String {
        return "DLInterfaceBuilderDrawables"
    }
    
    static public  func convert(fromString string: String) -> AnyObject? {
        if let value = DLSelectorPerformer.performSelector(string, forClass: moduleName() + "." + String(Self)) {
            return value
        } else {
            return nil
        }
    }
}

public func convert<T : StringValueConvertibleClass>(fromString string: String) -> T? {
    if string.characters.count > 0, let instance = T.convert(fromString: string) as? T {
        return instance
    } else {
        return nil
    }
}