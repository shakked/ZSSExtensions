//
//  CALayer+Extensions.swift
//  Instagrowth
//
//  Created by Zachary Shakked on 1/11/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension CALayer {
    var borderUIColor : UIColor {
        set {
            borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: borderColor!)
        }
    }
    
    var shadowUIColor : UIColor {
        set {
            shadowColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: shadowColor!)
        }
    }

    public func applySketchShadow(color: UIColor = .black,
                                  alpha: Float = 0.5,
                                  x: CGFloat = 0,
                                  y: CGFloat = 2,
                                  blur: CGFloat = 4,
                                  spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
