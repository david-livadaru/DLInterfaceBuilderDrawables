//
//  CALayerDrawableType.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 18/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import Foundation

public protocol CALayerDrawableType : DrawableType {
    var cornerRadius: CGFloat { get set }
    
    var borderWidth: CGFloat { get set }
    var borderColorName: String { get set }
    
    var shadowApplied: Bool { get set }
    var shadowColorName: String { get set }
    var shadowOpacity: Float { get set }
    var shadowOffsetPoint: CGSize { get set }
    var shadowRadius: CGFloat { get set }
    
    func applyCornerRadius()
    func applyBorder()
    func applyShadow()
}

extension CALayerDrawableType where Self : UIView {
    public func applyCornerRadius() {
        layer.cornerRadius = cornerRadius
    }
    
    public func applyBorder() {
        layer.borderWidth = borderWidth
        if let borderColor: UIColor = convertFrom(string: borderColorName) {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    public func applyShadow() {
        if shadowApplied {
            if let shadowColor: UIColor = convertFrom(string: shadowColorName) {
                layer.shadowColor = shadowColor.CGColor
            }
            layer.shadowOpacity = Self.opacity(from: shadowOpacity)
            layer.shadowOffset = shadowOffsetPoint
            layer.shadowRadius = shadowRadius
        }
    }
}