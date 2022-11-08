//
//  DeviceConstantButton.swift
//  
//
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import Foundation
import UIKit

public class DeviceConstantButton: StandardButton {
    
    @IBInspectable public var smallFontSize: CGFloat = 0.0 {
        didSet {
            if smallFontSize != 0.0, DeviceConstants.currentSize == .small {
                titleLabel?.font = titleLabel?.font.withSize(smallFontSize)
            }
        }
    }
    
    @IBInspectable public var mediumFontSize: CGFloat = 0.0 {
        didSet {
            if mediumFontSize != 0.0, DeviceConstants.currentSize == .medium {
                titleLabel?.font = titleLabel?.font.withSize(mediumFontSize)
            }
        }
    }
    
    @IBInspectable public var largeFontSize: CGFloat = 0.0 {
        didSet {
            if largeFontSize != 0.0, DeviceConstants.currentSize == .large {
                titleLabel?.font = titleLabel?.font.withSize(largeFontSize)
            }
        }
    }
}
