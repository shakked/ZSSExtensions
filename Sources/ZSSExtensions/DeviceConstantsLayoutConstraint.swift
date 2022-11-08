//
//  DeviceConstantsLayoutConstraint.swift
//  
//
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import Foundation
import UIKit

public class DeviceConstantsLayoutConstraint: NSLayoutConstraint {
    
    public var constantForCurrentDevice: CGFloat {
        switch DeviceConstants.currentSize {
        case .small: return smallConstant
        case .medium: return mediumConstant
        case .large: return largeConstant
        }
    }
    
    @IBInspectable public var smallConstant: CGFloat = 0.0 {
        didSet {
            if smallConstant != 0.0, DeviceConstants.currentSize == .small {
                constant = smallConstant
            }
        }
    }
    
    @IBInspectable public var mediumConstant: CGFloat = 0.0 {
        didSet {
            if mediumConstant != 0.0, DeviceConstants.currentSize == .medium {
                constant = mediumConstant
            }
        }
    }
    
    @IBInspectable public var largeConstant: CGFloat = 0.0 {
        didSet {
            if largeConstant != 0.0, DeviceConstants.currentSize == .large {
                constant = largeConstant
            }
        }
    }
}
