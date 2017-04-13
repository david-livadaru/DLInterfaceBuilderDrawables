//
//  DrawableBorderSideView.swift
//  DLInterfaceBuilderDrawables
//
//  Created by David Livadaru on 20/07/16.
//  Copyright © 2016 Community. All rights reserved.
//

import UIKit

private protocol LineRenderedType {
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint)
}

extension LineRenderedType where Self : UIView {
    fileprivate func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context.closePath()
        context.strokePath()
    }
}

@IBDesignable open class DrawableBorderSideView: UIView, DrawableType, LineRenderedType {
    @IBInspectable open var borderColorName: String = "" {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable open var borderWidth: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable open var borderSides: String = "" {
        didSet {
            borderSidesList = BorderSides.convert(from: borderSides)
            setNeedsDisplay()
        }
    }
    private var borderSidesList: BorderSides?
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.saveGState()
        
        if let borderColor: UIColor = DLInterfaceBuilderDrawables.convert(from: borderColorName) {
            borderColor.setStroke()
        }
        
        context.setLineWidth(borderWidth)
        
        if borderSidesList?.contains(.Top) == true {
            drawLine(from: CGPoint(x: rect.minX, y: rect.minY),
                     to: CGPoint(x: rect.maxX, y: rect.minY))
        }
        
        if borderSidesList?.contains(.Left) == true {
            drawLine(from: CGPoint(x: rect.minX, y: rect.minY),
                     to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        
        if borderSidesList?.contains(.Bottom) == true {
            drawLine(from: CGPoint(x: rect.minX, y: rect.maxY),
                     to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        if borderSidesList?.contains(.Right) == true {
            drawLine(from: CGPoint(x: rect.maxX, y: rect.minY),
                     to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        context.restoreGState()
    }
}
