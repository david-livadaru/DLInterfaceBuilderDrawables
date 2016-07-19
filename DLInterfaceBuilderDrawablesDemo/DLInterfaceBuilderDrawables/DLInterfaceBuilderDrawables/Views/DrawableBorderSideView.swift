//
//  DrawableBorderSideView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 20/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

private protocol LineRenderedType {
    func drawLine(fromPoint fromPoint: CGPoint, toPoint: CGPoint)
}

extension LineRenderedType where Self : UIView {
    func drawLine(fromPoint fromPoint: CGPoint, toPoint: CGPoint) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        CGContextClosePath(context)
        CGContextStrokePath(context)
    }
}

@IBDesignable public class DrawableBorderSideView: UIView, DrawableType, LineRenderedType {
    @IBInspectable public var borderColorName: String = "" {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var borderSides: String = "" {
        didSet {
            borderSidesList = BorderSides.convertFrom(string: borderSides)
            setNeedsDisplay()
        }
    }
    private var borderSidesList: BorderSides?
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(context)
        
        if let borderColor: UIColor = convertFrom(string: borderColorName) {
            borderColor.setStroke()
        }
        
        CGContextSetLineWidth(context, borderWidth)
        
        if borderSidesList?.contains(.Top) == true {
            drawLine(fromPoint: CGPoint(x: rect.minX, y: rect.minY),
                     toPoint: CGPoint(x: rect.maxX, y: rect.minY))
        }
        
        if borderSidesList?.contains(.Left) == true {
            drawLine(fromPoint: CGPoint(x: rect.minX, y: rect.minY),
                     toPoint: CGPoint(x: rect.minX, y: rect.maxY))
        }
        
        if borderSidesList?.contains(.Bottom) == true {
            drawLine(fromPoint: CGPoint(x: rect.minX, y: rect.maxY),
                     toPoint: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        if borderSidesList?.contains(.Right) == true {
            drawLine(fromPoint: CGPoint(x: rect.maxX, y: rect.minY),
                     toPoint: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        CGContextRestoreGState(context)
    }

}
