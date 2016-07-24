//
//  Foundation+Additions.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 24/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func append(fromDictionary dictionary: Dictionary) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }
}
