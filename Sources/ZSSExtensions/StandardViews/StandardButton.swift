//
//  Button.swift
//  Command
//
//  Created by Zachary Shakked on 1/20/18.
//  Copyright © 2018 Zachary Shakked. All rights reserved.
//

import UIKit

public class StandardButton: UIButton {
    
    @IBInspectable public var extraTapPadding: CGFloat = 0
    
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if extraTapPadding != 0 {
            let biggerFrame = bounds.insetBy(dx: -extraTapPadding, dy: -extraTapPadding)
            return biggerFrame.contains(point)
        }
        return super.point(inside: point, with: event)
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var borderColor: UIColor? = nil {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
}

