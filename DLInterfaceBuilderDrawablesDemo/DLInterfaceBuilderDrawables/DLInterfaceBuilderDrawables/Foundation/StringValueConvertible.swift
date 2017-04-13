//
//  StringValueConvertible.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol StringValueConvertibleType {
    static func convert(from string: String) -> Self?
}

public protocol StringValueConvertibleClass: class {
    static func moduleName() -> String
    static func convert(from string: String) -> AnyObject?
}

extension StringValueConvertibleClass where Self : NSObject {
    static public func moduleName() -> String {
        return "DLInterfaceBuilderDrawables"
    }
    
    static public func convert(from string: String) -> AnyObject? {
        if let invocation = DLInvocation(with: Self.self, selectorName: string),
            let value = invocation.valueFromInvocation() {
            return value as AnyObject
        } else {
            return nil
        }
    }
}

public func convert<T: StringValueConvertibleClass>(from string: String) -> T? {
    if string.characters.count > 0, let instance = T.convert(from: string) as? T {
        return instance
    } else {
        return nil
    }
}
